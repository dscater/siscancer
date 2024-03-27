<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Diagnóstico por Imágenes",
        disabled: false,
        url: route("diagnosticos.index"),
        name_url: "diagnosticos.index",
    },
    {
        title: "Nuevo",
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
import { onMounted } from "vue";
import { useMenu } from "@/composables/useMenu";
import { useDiagnosticos } from "@/composables/diagnosticos/useDiagnosticos";
import Formulario from "./parcials/Formulario.vue";
const { mobile, identificaDispositivo } = useMenu();
const { setLoading } = useApp();
const { oDiagnostico, limpiarDiagnostico } = useDiagnosticos();
limpiarDiagnostico();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});
</script>
<template>
    <Head title="Diagnóstico por Imágenes"></Head>
    <v-container>
        <BreadBrums :breadbrums="breadbrums"></BreadBrums>
        <v-row class="mt-0">
            <v-col cols="12" sm="12" md="12">
                <Formulario></Formulario>
            </v-col>
        </v-row>
    </v-container>
</template>
