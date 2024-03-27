<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { useEntrenamientos } from "@/composables/entrenamientos/useEntrenamientos";
import { useMenu } from "@/composables/useMenu";
import { watch, ref, reactive, computed, onMounted } from "vue";
import MiDropZone from "@/Components/MiDropZone.vue";
import axios from "axios";

const { mobile, cambiarUrl } = useMenu();
const { oEntrenamiento, limpiarEntrenamiento } = useEntrenamientos();
let form = useForm(oEntrenamiento);

const { flash, auth } = usePage().props;
const user = ref(auth.user);

const listTipos = ref([]);

const tituloDialog = computed(() => {
    return oEntrenamiento.id == 0
        ? `Agregar Entrenamiento de Imágenes`
        : `Editar Entrenamiento de Imágenes`;
});

const disabled = ref(false);
const loading = ref(false);

const enviarFormulario = () => {
    loading.value = true;
    let url =
        form["_method"] == "POST"
            ? route("entrenamientos.store")
            : route("entrenamientos.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            loading.value = false;
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            limpiarEntrenamiento();
        },
        onError: (err) => {
            loading.value = false;

            Swal.fire({
                icon: "info",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.error
                        ? err.error
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
        },
    });
};

const cargarListas = () => {
    getTiposDiagnosticos();
};

const getTiposDiagnosticos = (data) => {
    axios
        .get(route("entrenamientos.getTiposDiagnosticos"), {
            params: data,
        })
        .then((response) => {
            listTipos.value = response.data;
        });
};

const detectaArchivos = (files) => {
    disabled.value = true;
    form.entrenamiento_imagens = [];
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        form.entrenamiento_imagens.push(file.file);
    }
    setTimeout(() => {
        disabled.value = false;
    }, 500);
};

const detectaEliminados = (files) => {
    disabled.value = true;
    form.eliminados = [];
    for (let i = 0; i < files.length; i++) {
        const id = files[i];
        form.eliminados.push(id);
    }
    setTimeout(() => {
        disabled.value = false;
    }, 500);
};

onMounted(() => {
    if (form.id && form.id != "") {
        cargarListas({
            tipo: form.tipo,
        });
    } else {
        cargarListas();
    }
});
</script>

<template>
    <v-row class="mt-0">
        <v-col cols="12" class="d-flex justify-end">
            <template v-if="mobile">
                <v-btn
                    icon="mdi-arrow-left"
                    class="mr-2"
                    @click="cambiarUrl(route('entrenamientos.index'))"
                ></v-btn>
                <v-btn
                    :disabled="disabled"
                    icon="mdi-content-save"
                    color="cyan-darken-2"
                    @click="enviarFormulario"
                ></v-btn>
            </template>
            <template v-if="!mobile">
                <v-btn
                    prepend-icon="mdi-arrow-left"
                    class="mr-2"
                    @click="cambiarUrl(route('entrenamientos.index'))"
                >
                    Volver</v-btn
                >
                <v-btn
                    :disabled="disabled"
                    :prepend-icon="
                        oEntrenamiento.id != 0 ? 'mdi-sync' : 'mdi-content-save'
                    "
                    color="cyan-darken-2"
                    @click="enviarFormulario"
                >
                    <span
                        v-text="
                            oEntrenamiento.id != 0
                                ? 'Actualizar Entrenamiento de Imágenes'
                                : 'Guardar Entrenamiento de Imágenes'
                        "
                    ></span
                ></v-btn>
            </template>
        </v-col>
    </v-row>
    <v-row>
        <v-col cols="12">
            <v-card>
                <v-card-title class="border-b cyan-darken-2 pa-5">
                    <v-icon
                        :icon="form.id == 0 ? 'mdi-plus' : 'mdi-pencil'"
                    ></v-icon>
                    <span class="text-h5" v-html="tituloDialog"></span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <form @submit.prevent="enviarFormulario">
                            <v-row
                                class="d-flex justify-center contenedor_entrenamiento"
                            >
                                <div class="loading" v-if="loading">
                                    <p class="text-body-1 text-white">
                                        Entrenando...
                                    </p>
                                    <div class="loader"></div>
                                    <p class="text-caption text-white">
                                        ¡Espere porfavor!
                                    </p>
                                    <!-- <p class="text-caption text-white">90%</p> -->
                                </div>
                                <v-col cols="12" sm="12" md="4" xl="3">
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
                                        clearable
                                        variant="outlined"
                                        label="Seleccionar tipo de Diagnóstico*"
                                        :items="listTipos"
                                        item-value="id"
                                        item-title="full_name"
                                        required
                                        density="compact"
                                        v-model="form.tipo"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12">
                                    <h4
                                        class="text-center text-body-1 mb-0 pb-0"
                                    >
                                        Cargar imágenes
                                    </h4>
                                </v-col>
                                <v-col cols="12">
                                    <MiDropZone
                                        :files="form.entrenamiento_imagens"
                                        @UpdateFiles="detectaArchivos"
                                        @addEliminados="detectaEliminados"
                                    ></MiDropZone>

                                    <p
                                        class="text-body-2 text-red-darken-3 text-center"
                                        v-if="
                                            form.errors?.entrenamiento_imagens
                                        "
                                    >
                                        {{ form.errors?.entrenamiento_imagens }}
                                    </p>
                                </v-col>
                            </v-row>
                        </form>
                    </v-container>
                </v-card-text>
            </v-card>
        </v-col>
    </v-row>
</template>

<style scoped>
.contenedor_entrenamiento {
    position: relative;
}

.contenedor_entrenamiento .loading {
    position: absolute;
    display: flex;
    gap: 10px;
    width: 100%;
    height: 100%;
    background-color: var(--principal);
    z-index: 400;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.contenedor_entrenamiento .loader {
    width: 64px;
    height: 64px;
    position: relative;
    background: #f4f4f4;
    border-radius: 4px;
    overflow: hidden;
}

.contenedor_entrenamiento .loader:before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 40px;
    height: 40px;
    transform: rotate(45deg) translate(30%, 40%);
    background: #2e86de;
    box-shadow: 32px -34px 0 5px #0097e6;
    animation: slide 2s infinite ease-in-out alternate;
}

.contenedor_entrenamiento .loader:after {
    content: "";
    position: absolute;
    left: 10px;
    top: 10px;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    background: #0097e6;
    transform: rotate(0deg);
    transform-origin: 35px 145px;
    animation: rotate 2s infinite ease-in-out;
}

@keyframes slide {
    0%,
    100% {
        bottom: -35px;
    }

    25%,
    75% {
        bottom: -2px;
    }

    20%,
    80% {
        bottom: 2px;
    }
}

@keyframes rotate {
    0% {
        transform: rotate(-15deg);
    }

    25%,
    75% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(25deg);
    }
}
</style>
