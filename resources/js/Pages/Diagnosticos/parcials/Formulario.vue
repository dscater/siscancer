<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { useDiagnosticos } from "@/composables/diagnosticos/useDiagnosticos";
import { usePacientes } from "@/composables/pacientes/usePacientes";
import { useMenu } from "@/composables/useMenu";
import { watch, ref, reactive, computed, onMounted } from "vue";
import axios from "axios";

const { mobile, cambiarUrl } = useMenu();
const { oDiagnostico, limpiarDiagnostico } = useDiagnosticos();
let form = useForm(oDiagnostico);

const { flash, auth } = usePage().props;
const user = ref(auth.user);
const { getPacientes } = usePacientes();

const listPacientes = ref([]);

const tituloDialog = computed(() => {
    return oDiagnostico.id == 0
        ? `Agregar Diagnóstico por Imágen`
        : `Editar Diagnóstico por Imágen`;
});

let disabled = ref(false);

const enviarFormulario = () => {
    let url =
        form["_method"] == "POST"
            ? route("diagnosticos.store")
            : route("diagnosticos.update", form.id);

    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: () => {
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            limpiarDiagnostico();
            cambiarUrl(route("diagnosticos.index"));
        },
        onError: (err) => {
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

const cargarListas = async (
    paciente_id = null,
    sin_diagnostico = false,
    con_historial = false
) => {
    listPacientes.value = await getPacientes({
        order: "desc",
        id: paciente_id,
        sin_diagnostico,
        con_historial,
    });
};

const imagen_cargada = ref(false);
const i_imagen = ref(null);
function cargaArchivo(e, key) {
    form[key] = null;
    form[key] = e.target.files[0];
    form.url_imagen1 = URL.createObjectURL(form[key]);
    imagen_cargada.value = true;
    e.target.value = null;
}

const loading = ref(false);

const generarDiagnostico = async () => {
    loading.value = true;

    var formData = new FormData();
    formData.append("imagen", form["imagen1"]);

    try {
        const response = await axios.post(
            route("diagnosticos.procesarImagen"),
            formData,
            {
                headers: { "Content-type": "multipart/form-data" },
            }
        );
        if (response) {
            form["url_imagen2"] = response.data.url_imagen2;
            form["imagen2"] = await generaArchivo2(response.data.url_imagen2);
            form["diagnostico"] = response.data.diagnostico;
            setTimeout(() => {
                loading.value = false;
            }, 1500);
        }
    } catch (err) {
        console.log(err);
    }
};

const generaArchivo2 = async (url) => {
    const response = await axios.get(url, { responseType: "blob" });
    // Obtener la extensión del archivo desde la URL
    const extension = url.split(".").pop(); // Obtener la extensión del archivo

    // Convertir la respuesta en un objeto Blob
    const blob = new Blob([response.data], {
        type: response.headers["content-type"],
    });

    // Crear un objeto File a partir del Blob
    const file = new File([blob], `nombre_archivo.${extension}`, {
        type: response.headers["content-type"],
    });
    return file;
};

onMounted(() => {
    if (form.id && form.id != "") {
        cargarListas(form.paciente_id, true, true);
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
                    @click="cambiarUrl(route('diagnosticos.index'))"
                ></v-btn>
                <v-btn
                    icon="mdi-content-save"
                    color="cyan-darken-2"
                    @click="enviarFormulario"
                ></v-btn>
            </template>
            <template v-if="!mobile">
                <v-btn
                    prepend-icon="mdi-arrow-left"
                    class="mr-2"
                    @click="cambiarUrl(route('diagnosticos.index'))"
                >
                    Volver</v-btn
                >
                <v-btn
                    :disbled="disabled"
                    :prepend-icon="
                        oDiagnostico.id != 0 ? 'mdi-sync' : 'mdi-content-save'
                    "
                    color="cyan-darken-2"
                    @click="enviarFormulario"
                >
                    <span
                        v-text="
                            oDiagnostico.id != 0
                                ? 'Actualizar Diagnóstico por Imágen'
                                : 'Guardar Diagnóstico por Imágen'
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
                            <v-row class="contenedor_diagnostico">
                                <div class="loading" v-if="loading">
                                    <p class="text-body-1 text-white">
                                        Analizando imagen...
                                    </p>
                                    <div class="loader"></div>
                                    <p class="text-caption text-white">
                                        ¡Espere porfavor!
                                    </p>
                                </div>

                                <v-col cols="12" xs="12" sm="12" md="5" xl="5">
                                    <v-card>
                                        <v-card-text>
                                            <v-row>
                                                <v-col cols="12">
                                                    <v-select
                                                        :hide-details="
                                                            form.errors
                                                                ?.paciente_id
                                                                ? false
                                                                : true
                                                        "
                                                        :error="
                                                            form.errors
                                                                ?.paciente_id
                                                                ? true
                                                                : false
                                                        "
                                                        :error-messages="
                                                            form.errors
                                                                ?.paciente_id
                                                                ? form.errors
                                                                      ?.paciente_id
                                                                : ''
                                                        "
                                                        clearable
                                                        variant="outlined"
                                                        label="Seleccionar Paciente*"
                                                        :items="listPacientes"
                                                        item-value="id"
                                                        item-title="full_name"
                                                        required
                                                        density="compact"
                                                        v-model="
                                                            form.paciente_id
                                                        "
                                                    ></v-select>
                                                </v-col>
                                                <v-col cols="12">
                                                    <input
                                                        type="file"
                                                        ref="i_imagen"
                                                        @change="
                                                            cargaArchivo(
                                                                $event,
                                                                'imagen1'
                                                            )
                                                        "
                                                    />
                                                </v-col>
                                                <v-col
                                                    cols="12"
                                                    v-if="imagen_cargada"
                                                    class="text-center"
                                                >
                                                    <img
                                                        :src="form.url_imagen1"
                                                        alt="Imagen"
                                                        style="
                                                            max-width: 500px;
                                                            width: 100%;
                                                        "
                                                    />
                                                </v-col>
                                                <v-col
                                                    v-else
                                                    cols="12"
                                                    class="text-center"
                                                    >NO SE SELECCIONÓ NINGUNA
                                                    IMAGEN</v-col
                                                >
                                            </v-row>
                                        </v-card-text>
                                    </v-card>
                                </v-col>
                                <v-col
                                    cols="12"
                                    xs="12"
                                    sm="12"
                                    md="2"
                                    xl="2"
                                    class="d-flex align-center"
                                >
                                    <v-btn
                                        class="btn-wrap-text"
                                        color="cyan-darken-2"
                                        size="x-large"
                                        @click="generarDiagnostico"
                                        :disabled="
                                            !form.url_imagen1 ||
                                            form.url_imagen1 == ''
                                                ? true
                                                : false
                                        "
                                    >
                                        <p>GENERAR <br />DIAGNÓSTICO</p>
                                    </v-btn>
                                </v-col>
                                <v-col cols="12" xs="12" sm="12" md="5" xl="5">
                                    <v-card>
                                        <v-card-text>
                                            <v-row>
                                                <v-col
                                                    cols="12"
                                                    v-if="form.url_imagen2"
                                                    class="text-center"
                                                >
                                                    <img
                                                        :src="form.url_imagen2"
                                                        alt="Imagen"
                                                        style="
                                                            max-width: 500px;
                                                            width: 100%;
                                                        "
                                                    />
                                                </v-col>
                                                <v-col
                                                    v-else
                                                    cols="12"
                                                    class="text-center h-50"
                                                >
                                                    RESULTADO DEL DIAGNOSTICO
                                                </v-col>
                                            </v-row>
                                        </v-card-text>
                                    </v-card>
                                </v-col>
                            </v-row>
                            <v-row v-if="form.diagnostico">
                                <v-col cols="12">
                                    <v-card>
                                        <v-card-title>
                                            <h4 class="text-center">
                                                DIAGNÓSTICO
                                            </h4>
                                        </v-card-title>
                                        <v-card-text>
                                            <v-row>
                                                <v-col
                                                    cols="12"
                                                    class="text-h4 bg-grey-darken-2 text-center font-weight-bold"
                                                >
                                                    {{ form.diagnostico }}
                                                </v-col>
                                            </v-row>
                                        </v-card-text>
                                    </v-card>
                                </v-col>
                                <v-col cols="12">
                                    <v-textarea
                                        :hide-details="
                                            form.errors?.descripcion
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.descripcion
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.descripcion
                                                ? form.errors?.descripcion
                                                : ''
                                        "
                                        rows="1"
                                        auto-grow
                                        variant="outlined"
                                        label="Descripción*"
                                        required
                                        density="compact"
                                        v-model="form.descripcion"
                                    ></v-textarea>
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
.contenedor_diagnostico {
    position: relative;
}

.contenedor_diagnostico .loading {
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

.contenedor_diagnostico .loader {
    width: 64px;
    height: 64px;
    position: relative;
    background: #f4f4f4;
    border-radius: 4px;
    overflow: hidden;
}

.contenedor_diagnostico .loader:before {
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

.contenedor_diagnostico .loader:after {
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
