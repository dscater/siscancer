<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Pacientes",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { Head } from "@inertiajs/vue3";
import { usePacientes } from "@/composables/pacientes/usePacientes";
import { ref, onMounted } from "vue";
import { useMenu } from "@/composables/useMenu";
import Formulario from "./Formulario.vue";
const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
onMounted(() => {
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const { getPacientesApi, setPaciente, limpiarPaciente, deletePaciente } =
    usePacientes();
const responsePacientes = ref([]);
const listPacientes = ref([]);
const itemsPerPage = ref(5);
const headers = ref([
    {
        title: "Id",
        align: "start",
        key: "id",
        sortable: false,
    },
    { title: "Nombre", key: "full_name", align: "start", sortable: false },
    { title: "C.I.", key: "full_ci", align: "start", sortable: false },
    { title: "Celular", align: "start", sortable: false },
    { title: "Celular Familiar", align: "start", sortable: false },
    { title: "Foto", align: "start", sortable: false },
    { title: "Correo electrónico", align: "start", sortable: false },
    { title: "Más", align: "start", sortable: false },
    { title: "Acción", key: "accion", align: "end", sortable: false },
]);

const search = ref("");
const options = ref({
    page: 1,
    itemsPerPage: itemsPerPage,
    sortBy: "",
    sortOrder: "desc",
    search: "",
});

const loading = ref(true);
const totalItems = ref(0);
let setTimeOutLoadData = null;
const loadItems = async ({ page, itemsPerPage, sortBy }) => {
    loading.value = true;
    options.value.page = page;
    if (sortBy.length > 0) {
        options.value.sortBy = sortBy[0].key;
        options.value.sortOrder = sortBy[0].order;
    }
    options.value.search = search.value;

    clearInterval(setTimeOutLoadData);
    setTimeOutLoadData = setTimeout(async () => {
        responsePacientes.value = await getPacientesApi(options.value);
        listPacientes.value = responsePacientes.value.data;
        totalItems.value = parseInt(responsePacientes.value.total);
        loading.value = false;
    }, 300);
};
const recargaPacientes = async () => {
    loading.value = true;
    listPacientes.value = [];
    options.value.search = search.value;
    responsePacientes.value = await getPacientesApi(options.value);
    listPacientes.value = responsePacientes.value.data;
    totalItems.value = parseInt(responsePacientes.value.total);
    setTimeout(() => {
        loading.value = false;
        open_dialog.value = false;
    }, 300);
};
const accion_dialog = ref(0);
const open_dialog = ref(false);

const agregarRegistro = () => {
    limpiarPaciente();
    accion_dialog.value = 0;
    open_dialog.value = true;
};
const editarPaciente = (item) => {
    setPaciente(item);
    accion_dialog.value = 1;
    open_dialog.value = true;
};

const eliminarPaciente = (item) => {
    Swal.fire({
        title: "¿Quierés eliminar este registro?",
        html: `<strong>${item.full_name}</strong>`,
        showCancelButton: true,
        confirmButtonColor: "#B61431",
        confirmButtonText: "Si, eliminar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            let respuesta = await deletePaciente(item.id);
            if (respuesta && respuesta.sw) {
                recargaPacientes();
            }
        }
    });
};
</script>
<template>
    <Head title="Pacientes"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12" class="d-flex justify-end">
                <v-btn
                    color="cyan-darken-2"
                    prepend-icon="mdi-plus"
                    @click="agregarRegistro"
                >
                    Agregar</v-btn
                >
            </v-col>
        </v-row>
        <v-row class="mt-0">
            <v-col cols="12">
                <v-card flat>
                    <v-card-title>
                        <v-row
                            class="bg-cyan-darken-2 d-flex align-center pa-3"
                        >
                            <v-col cols="12" sm="6" md="4"> Pacientes </v-col>
                            <v-col cols="12" sm="6" md="4" offset-md="4">
                                <v-text-field
                                    v-model="search"
                                    label="Buscar"
                                    append-inner-icon="mdi-magnify"
                                    variant="underlined"
                                    clearable
                                    hide-details
                                ></v-text-field>
                            </v-col>
                        </v-row>
                    </v-card-title>
                    <v-card-text>
                        <v-data-table-server
                            v-model:items-per-page="itemsPerPage"
                            :headers="!mobile ? headers : []"
                            :class="[mobile ? 'mobile' : '']"
                            :items-length="totalItems"
                            :items="listPacientes"
                            :loading="loading"
                            :search="search"
                            @update:options="loadItems"
                            height="auto"
                            no-data-text="No se encontrarón registros"
                            loading-text="Cargando..."
                            page-text="{0} - {1} de {2}"
                            items-per-page-text="Registros por página"
                            :items-per-page-options="[
                                { value: 10, title: '10' },
                                { value: 25, title: '25' },
                                { value: 50, title: '50' },
                                { value: 100, title: '100' },
                                {
                                    value: -1,
                                    title: 'Todos',
                                },
                            ]"
                        >
                            <template v-slot:item="{ item }">
                                <template v-if="!mobile">
                                    <tr>
                                        <td>{{ item.id }}</td>
                                        <td class="text-xs-right">
                                            {{ item.full_name }}
                                        </td>
                                        <td>{{ item.full_ci }}</td>
                                        <td>{{ item.cel }}</td>
                                        <td>{{ item.cel_familiar }}</td>
                                        <td>
                                            <v-avatar color="cyan-darken-2">
                                                <v-img
                                                    v-if="item.url_foto"
                                                    :src="item.url_foto"
                                                    cover
                                                    :lazy-src="item.url_foto"
                                                ></v-img>
                                                <span v-else>{{
                                                    item.iniciales_nombre
                                                }}</span>
                                            </v-avatar>
                                        </td>
                                        <td>{{ item.correo }}</td>
                                        <td>
                                            <v-btn
                                                :icon="
                                                    item.mas
                                                        ? 'mdi-chevron-down'
                                                        : 'mdi-chevron-left'
                                                "
                                                @click="item.mas = !item.mas"
                                            ></v-btn>
                                        </td>
                                        <td class="text-right">
                                            <v-btn
                                                color="yellow"
                                                size="small"
                                                class="pa-1 ma-1"
                                                @click="editarPaciente(item)"
                                                icon="mdi-pencil"
                                            ></v-btn>
                                            <v-btn
                                                color="error"
                                                size="small"
                                                class="pa-1 ma-1"
                                                @click="eliminarPaciente(item)"
                                                icon="mdi-trash-can"
                                            ></v-btn>
                                        </td>
                                    </tr>

                                    <tr v-if="item.mas">
                                        <td
                                            :colspan="headers.length"
                                            class="py-5"
                                        >
                                            <v-row>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Fecha de
                                                            nacimiento</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.fecha_nac
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Estado Civil</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.estado_civil
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Sexo</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.sexo
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Ocupación</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.ocupacion
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Dirección
                                                            Trabajo</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.dir_trabajo
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Dirección
                                                            Domicilio</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.dir_domicilio
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                                <v-col
                                                    cols="3"
                                                    class="text-center"
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            class="pb-0 text-caption font-weight-black"
                                                            >Fecha de
                                                            Registro</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.fecha_registro_t
                                                        }}</v-col>
                                                    </v-row>
                                                </v-col>
                                            </v-row>
                                        </td>
                                    </tr>
                                </template>
                                <template v-else>
                                    <tr>
                                        <td>
                                            <ul class="flex-content">
                                                <li
                                                    class="flex-item"
                                                    data-label="Id"
                                                >
                                                    {{ item.id }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Nombre"
                                                >
                                                    {{ item.full_name }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="C.I:"
                                                >
                                                    {{ item.full_ci }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Dirección"
                                                >
                                                    {{ item.dir }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Celular"
                                                >
                                                    {{ item.cel }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Celular Familiar"
                                                >
                                                    {{ item.cel_familiar }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Foto"
                                                >
                                                    <v-avatar
                                                        color="cyan-darken-2"
                                                    >
                                                        <v-img
                                                            v-if="item.url_foto"
                                                            :src="item.url_foto"
                                                            cover
                                                            :lazy-src="
                                                                item.url_foto
                                                            "
                                                        ></v-img>
                                                        <span v-else>{{
                                                            item.iniciales_nombre
                                                        }}</span>
                                                    </v-avatar>
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Correo Electrónico"
                                                >
                                                    {{ item.correo }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Fecha de Nacimiento"
                                                >
                                                    {{ item.fecha_nac }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Estado Civil"
                                                >
                                                    {{ item.estado_civil }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Sexo"
                                                >
                                                    {{ item.sexo }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Ocupación"
                                                >
                                                    {{ item.ocupacion }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Dirección Trabajo"
                                                >
                                                    {{ item.dir_trabajo }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Dirección Domicilio"
                                                >
                                                    {{ item.dir_domicilio }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Fecha de Registro"
                                                >
                                                    {{ item.fecha_registro_t }}
                                                </li>
                                            </ul>
                                            <v-row>
                                                <v-col
                                                    cols="12"
                                                    class="text-center pa-5"
                                                >
                                                    <v-btn
                                                        color="yellow"
                                                        size="small"
                                                        class="pa-1 ma-1"
                                                        @click="
                                                            editarPaciente(item)
                                                        "
                                                        icon="mdi-pencil"
                                                    ></v-btn>
                                                    <v-btn
                                                        color="error"
                                                        size="small"
                                                        class="pa-1 ma-1"
                                                        @click="
                                                            eliminarPaciente(
                                                                item
                                                            )
                                                        "
                                                        icon="mdi-trash-can"
                                                    ></v-btn>
                                                </v-col>
                                            </v-row>
                                        </td>
                                    </tr>
                                </template>
                            </template>
                        </v-data-table-server>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
        <Formulario
            :open_dialog="open_dialog"
            :accion_dialog="accion_dialog"
            @envio-formulario="recargaPacientes"
            @cerrar-dialog="open_dialog = false"
        ></Formulario>
    </v-container>
</template>
