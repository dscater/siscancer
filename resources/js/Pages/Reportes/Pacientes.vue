<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Reporte Pacientes",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>

<script setup>
import BreadBrums from "@/Components/BreadBrums.vue";
import { useApp } from "@/composables/useApp";
import { computed, onMounted, ref } from "vue";
import { Head, usePage } from "@inertiajs/vue3";
const { setLoading } = useApp();

onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const existe_validacion_fechas = ref(false);

const rules_fechas = ref([
    (value) => {
        if (value) {
            existe_validacion_fechas.value = false;
            return true;
        }
        existe_validacion_fechas.value = true;
        return "Debes seleccionar una fecha";
    },
]);

const listFiltro = ref([
    {
        value: "todos",
        label: "TODOS",
    },
    {
        value: "fechas",
        label: "Rango de Fechas",
    },
    {
        value: "tipo",
        label: "Tipo de Diagnóstico",
    },
]);

const listTipos = ref([
    {
        value: "todos",
        label: "TODOS",
    },
    {
        value: "NO TIENE CANCER",
        label: "NO TIENE CANCER",
    },
    {
        value: "CANCER DE MAMA BENIGNO",
        label: "CANCER DE MAMA BENIGNO",
    },
    {
        value: "CANCER DE MAMA MALIGNO",
        label: "CANCER DE MAMA MALIGNO",
    },
]);

const form = ref({
    filtro: "todos",
    fecha_ini: "",
    fecha_fin: "",
    tipo: "todos",
});

const generando = ref(false);
const txtBtn = computed(() => {
    if (generando.value) {
        return "Generando Reporte...";
    }
    return "Generar Reporte";
});

const formulario = ref(null);

const generarReporte = async () => {
    const { valid } = await formulario.value.validate();
    if (valid) {
        generando.value = true;
        const url = route("reportes.r_pacientes", form.value);
        window.open(url, "_blank");
        setTimeout(() => {
            generando.value = false;
        }, 500);
    }
};
</script>
<template>
    <Head title="Reporte Pacientes"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row>
            <v-col cols="12" sm="12" md="12" xl="8" class="mx-auto">
                <v-card>
                    <v-card-item>
                        <v-container>
                            <v-form
                                @submit.prevent="generarReporte"
                                ref="formulario"
                            >
                                <v-row>
                                    <v-col cols="12">
                                        <v-select
                                            :hide-details="
                                                form.errors?.filtro
                                                    ? false
                                                    : true
                                            "
                                            :error="
                                                form.errors?.filtro
                                                    ? true
                                                    : false
                                            "
                                            :error-messages="
                                                form.errors?.filtro
                                                    ? form.errors?.filtro
                                                    : ''
                                            "
                                            variant="outlined"
                                            density="compact"
                                            required
                                            :items="listFiltro"
                                            item-value="value"
                                            item-title="label"
                                            label="Tipo*"
                                            v-model="form.filtro"
                                        ></v-select>
                                    </v-col>
                                    <v-col
                                        cols="12"
                                        v-if="form.filtro == 'fechas'"
                                    >
                                        <v-row>
                                            <v-col cols="6">
                                                <v-text-field
                                                    :hide-details="
                                                        !existe_validacion_fechas
                                                    "
                                                    type="date"
                                                    variant="outlined"
                                                    label="Fecha Inicio"
                                                    required
                                                    density="compact"
                                                    v-model="form.fecha_ini"
                                                    :rules="rules_fechas"
                                                ></v-text-field>
                                            </v-col>
                                            <v-col cols="6">
                                                <v-text-field
                                                    :hide-details="
                                                        !existe_validacion_fechas
                                                    "
                                                    type="date"
                                                    variant="outlined"
                                                    label="Fecha Inicio"
                                                    required
                                                    density="compact"
                                                    v-model="form.fecha_fin"
                                                    :rules="rules_fechas"
                                                ></v-text-field>
                                            </v-col>
                                        </v-row>
                                    </v-col>
                                    <v-col
                                        cols="12"
                                        v-if="form.filtro == 'tipo'"
                                    >
                                        <v-select
                                            :hide-details="
                                                form.errors?.tipo ? false : true
                                            "
                                            :error="
                                                form.errors?.tipo ? true : false
                                            "
                                            :error-messages="
                                                form.errors?.tipo
                                                    ? form.errors?.tipo
                                                    : ''
                                            "
                                            variant="outlined"
                                            density="compact"
                                            required
                                            :items="listTipos"
                                            item-value="value"
                                            item-title="label"
                                            label="Tipo*"
                                            v-model="form.tipo"
                                        ></v-select>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-btn
                                            color="cyan-darken-2"
                                            block
                                            @click="generarReporte"
                                            :disabled="generando"
                                            v-text="txtBtn"
                                        ></v-btn>
                                    </v-col>
                                </v-row>
                            </v-form>
                        </v-container>
                    </v-card-item>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
