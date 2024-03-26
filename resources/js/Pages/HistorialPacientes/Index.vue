<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Historial de Pacientes",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>
<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { useMenu } from "@/composables/useMenu";
import { Head } from "@inertiajs/vue3";
import { useHistorialPacientes } from "@/composables/historial_pacientes/useHistorialPacientes";
import { ref, onMounted } from "vue";
import VerArchivos from "./VerArchivos.vue";

const { mobile, identificaDispositivo, cambiarUrl } = useMenu();
const { setLoading } = useApp();
onMounted(() => {
    identificaDispositivo();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const {
    getHistorialPacientesApi,
    deleteHistorialPaciente,
    setHistorialPaciente,
} = useHistorialPacientes();
const responseHistorialPacientes = ref([]);
const listHistorialPacientes = ref([]);
const itemsPerPage = ref(5);
const headers = ref([
    {
        title: "Id",
        align: "start",
        sortable: false,
    },
    {
        title: "Paciente",
        align: "start",
        sortable: false,
    },
    { title: "Fecha primera consulta", align: "start", sortable: false },
    {
        title: "Meses en demora para consultar",
        align: "start",
        sortable: false,
    },
    {
        title: "Mamografía durante el año anterior",
        align: "start",
        sortable: false,
    },
    { title: "Biopsias mamarias previas", align: "start", sortable: false },
    {
        title: "Alguna fue hiperplasia atípica",
        align: "start",
        sortable: false,
    },
    { title: "Más", align: "start", sortable: false },
    { title: "Acción", align: "end", sortable: false },
]);

const search = ref("");
const options = ref({
    page: 1,
    itemsPerPage: itemsPerPage,
    sortBy: "",
    sortOrder: "desc",
    search: "",
});

const accion_dialog = ref(0);
const open_dialog = ref(false);

const verArchivos = (item) => {
    setHistorialPaciente(item, true);
    accion_dialog.value = 0;
    open_dialog.value = true;
};

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
        responseHistorialPacientes.value = await getHistorialPacientesApi(
            options.value
        );
        listHistorialPacientes.value = responseHistorialPacientes.value.data;
        totalItems.value = parseInt(responseHistorialPacientes.value.total);
        loading.value = false;
    }, 300);
};
const recargaHistorialPacientes = async () => {
    loading.value = true;
    listHistorialPacientes.value = [];
    options.value.search = search.value;
    responseHistorialPacientes.value = await getHistorialPacientesApi(
        options.value
    );
    listHistorialPacientes.value = responseHistorialPacientes.value.data;
    totalItems.value = parseInt(responseHistorialPacientes.value.total);
    setTimeout(() => {
        loading.value = false;
    }, 300);
};

const editarHistorialPaciente = (item) => {
    cambiarUrl(route("historial_pacientes.edit", item.id));
};

const eliminarHistorialPaciente = (item) => {
    Swal.fire({
        title: "¿Quierés eliminar el registro?",
        html: `Paciente: <strong>${item.paciente.full_name}</strong>`,
        showCancelButton: true,
        confirmButtonColor: "#B61431",
        confirmButtonText: "Si, eliminar",
        cancelButtonText: "No, cancelar",
        denyButtonText: `No, cancelar`,
    }).then(async (result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            let respuesta = await deleteHistorialPaciente(item.id);
            if (respuesta && respuesta.sw) {
                recargaHistorialPacientes();
            }
        }
    });
};
const verUbicación = async (item) => {};
</script>
<template>
    <Head title="Historial de Pacientes"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12" class="d-flex justify-end">
                <v-btn
                    color="cyan-darken-2"
                    prepend-icon="mdi-plus"
                    @click="cambiarUrl(route('historial_pacientes.create'))"
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
                            <v-col cols="12" sm="6" md="4">
                                Historial de Pacientes
                            </v-col>
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
                            :items="listHistorialPacientes"
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
                                        <td>
                                            {{ item.paciente.full_name }}
                                        </td>
                                        <td>
                                            {{ item.fecha_pc_t }}
                                        </td>
                                        <td>
                                            {{ item.meses_dpc }}
                                        </td>
                                        <td>{{ item.mamografia_aa }}</td>
                                        <td>{{ item.biopsias_mp }}</td>
                                        <td>{{ item.hiperplasia_a }}</td>
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
                                        <td class="text-right" width="5%">
                                            <v-btn
                                                color="cyan"
                                                size="small"
                                                class="pa-1 ma-1"
                                                @click="verArchivos(item)"
                                                icon="mdi-paperclip"
                                            ></v-btn>
                                            <v-btn
                                                color="yellow"
                                                size="small"
                                                class="pa-1 ma-1"
                                                @click="
                                                    editarHistorialPaciente(
                                                        item
                                                    )
                                                "
                                                icon="mdi-pencil"
                                            ></v-btn>
                                            <v-btn
                                                color="error"
                                                size="small"
                                                class="pa-1 ma-1"
                                                @click="
                                                    eliminarHistorialPaciente(
                                                        item
                                                    )
                                                "
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
                                                            >Cáncer de mama
                                                            previo</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.cancer_mp
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
                                                            >Lado del tumor
                                                            anterior</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.lado_ta
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
                                                            >Ha tenido cáncer en
                                                            algún otro lado del
                                                            cuerpo</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.cancer_olc
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
                                                            >Cuántos parientes
                                                            en primer grado de
                                                            cáncer de
                                                            mama</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.parientes_pgcm
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
                                                            >Otros parientes con
                                                            cáncer de
                                                            mama</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.otros_pccm
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
                                                            >Parientes con
                                                            cáncer de
                                                            ovario</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.parientes_cco
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
                                                            >Parientes con
                                                            cáncer de
                                                            colon</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.parientes_ccc
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
                                                            >Parientes con
                                                            cáncer de
                                                            endometrio</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.parientes_cce
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
                                                            >Parientes con otros
                                                            tipos de
                                                            cáncer</v-col
                                                        >
                                                        <v-col cols="12">{{
                                                            item.parientes_cotc
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
                                                    data-label="Paciente"
                                                >
                                                    {{
                                                        item.paciente.full_name
                                                    }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Fecha primera consulta"
                                                >
                                                    {{ item.fecha_pc_t }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Meses en demora para consultar"
                                                >
                                                    {{ item.meses_dpc }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Mamografía durante el año anterior"
                                                >
                                                    {{ item.mamografia_aa }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Biopsias mamarias previas"
                                                >
                                                    {{ item.biopsias_mp }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Alguna fue hiperplasia atípica"
                                                >
                                                    {{ item.hiperplasia_a }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Cáncer de mama previo"
                                                >
                                                    {{ item.cancer_mp }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Lado del tumor anterior"
                                                >
                                                    {{ item.lado_ta }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Ha tenido cáncer en algún otro lado del cuerpo"
                                                >
                                                    {{ item.cancer_olc }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Cuántos parientes en primer grado de cáncer de mama"
                                                >
                                                    {{ item.parientes_pgcm }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Otros parientes con cáncer de mama"
                                                >
                                                    {{ item.otros_pccm }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Parientes con cáncer de ovario"
                                                >
                                                    {{ item.parientes_cco }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Parientes con cáncer de colon"
                                                >
                                                    {{ item.parientes_ccc }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Parientes con cáncer de endometrio"
                                                >
                                                    {{ item.parientes_cce }}
                                                </li>
                                                <li
                                                    class="flex-item"
                                                    data-label="Parientes con otros tipos de cáncer"
                                                >
                                                    {{ item.parientes_cotc }}
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
                                                        color="cyan"
                                                        size="small"
                                                        class="pa-1 ma-1"
                                                        @click="
                                                            verArchivos(item)
                                                        "
                                                        icon="mdi-paperclip"
                                                    ></v-btn>
                                                    <v-btn
                                                        color="yellow"
                                                        size="small"
                                                        class="pa-1 ma-1"
                                                        @click="
                                                            editarHistorialPaciente(
                                                                item
                                                            )
                                                        "
                                                        icon="mdi-pencil"
                                                    ></v-btn>
                                                    <v-btn
                                                        color="error"
                                                        size="small"
                                                        class="pa-1 ma-1"
                                                        @click="
                                                            eliminarHistorialPaciente(
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
        <VerArchivos
            :open_dialog="open_dialog"
            :accion_dialog="accion_dialog"
            @envio-formulario="recargaHistorialPacientes"
            @cerrar-dialog="open_dialog = false"
        ></VerArchivos>
    </v-container>
</template>
