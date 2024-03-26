<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { useHistorialPacientes } from "@/composables/historial_pacientes/useHistorialPacientes";
import { usePacientes } from "@/composables/pacientes/usePacientes";
import { useMenu } from "@/composables/useMenu";
import { watch, ref, reactive, computed, onMounted } from "vue";
import MiDropZone from "@/Components/MiDropZone.vue";

const { mobile, cambiarUrl } = useMenu();
const { oHistorialPaciente, limpiarHistorialPaciente } =
    useHistorialPacientes();
let form = useForm(oHistorialPaciente);

const { flash, auth } = usePage().props;
const user = ref(auth.user);
const { getPacientes } = usePacientes();

const listPacientes = ref([]);

const tituloDialog = computed(() => {
    return oHistorialPaciente.id == 0
        ? `Agregar Historial de Paciente`
        : `Editar Historial de Paciente`;
});

const enviarFormulario = () => {
    let url =
        form["_method"] == "POST"
            ? route("historial_pacientes.store")
            : route("historial_pacientes.update", form.id);

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
            limpiarHistorialPaciente();
            cambiarUrl(route("historial_pacientes.index"));
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

const cargarListas = async (paciente_id = null, sin_historial = false) => {
    listPacientes.value = await getPacientes({
        order: "desc",
        id: paciente_id,
        sin_historial,
    });
};

onMounted(() => {
    if (form.id && form.id != "") {
        cargarListas(form.paciente_id, true);
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
                    @click="cambiarUrl(route('historial_pacientes.index'))"
                ></v-btn>
                <v-btn icon="mdi-content-save" color="primary"></v-btn>
            </template>
            <template v-if="!mobile">
                <v-btn
                    prepend-icon="mdi-arrow-left"
                    class="mr-2"
                    @click="cambiarUrl(route('historial_pacientes.index'))"
                >
                    Volver</v-btn
                >
                <v-btn
                    :prepend-icon="
                        oHistorialPaciente.id != 0
                            ? 'mdi-sync'
                            : 'mdi-content-save'
                    "
                    color="cyan-darken-2"
                    @click="enviarFormulario"
                >
                    <span
                        v-text="
                            oHistorialPaciente.id != 0
                                ? 'Actualizar Historial de Paciente'
                                : 'Guardar Historial de Paciente'
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
                            <v-row>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.paciente_id
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.paciente_id
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.paciente_id
                                                ? form.errors?.paciente_id
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
                                        v-model="form.paciente_id"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-text-field
                                        :hide-details="
                                            form.errors?.fecha_pc ? false : true
                                        "
                                        :error="
                                            form.errors?.fecha_pc ? true : false
                                        "
                                        :error-messages="
                                            form.errors?.fecha_pc
                                                ? form.errors?.fecha_pc
                                                : ''
                                        "
                                        variant="outlined"
                                        type="date"
                                        label="Fecha de Primera Consulta*"
                                        required
                                        density="compact"
                                        v-model="form.fecha_pc"
                                    ></v-text-field>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-text-field
                                        :hide-details="
                                            form.errors?.meses_dpc
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.meses_dpc
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.meses_dpc
                                                ? form.errors?.meses_dpc
                                                : ''
                                        "
                                        variant="outlined"
                                        label="Meses en demora para consultar*"
                                        required
                                        density="compact"
                                        v-model="form.meses_dpc"
                                    ></v-text-field>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.mamografia_aa
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.mamografia_aa
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.mamografia_aa
                                                ? form.errors?.mamografia_aa
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Mamografía durante el año anterior*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.mamografia_aa"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.biopsias_mp
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.biopsias_mp
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.biopsias_mp
                                                ? form.errors?.biopsias_mp
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Biopsias Mamarias Previas*"
                                        :items="[
                                            'NINGUNA',
                                            'UNA',
                                            'MAS DE UNA',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.biopsias_mp"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.hiperplasia_a
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.hiperplasia_a
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.hiperplasia_a
                                                ? form.errors?.hiperplasia_a
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Alguna Fue Hiperplasia Atípica*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.hiperplasia_a"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.cancer_mp
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.cancer_mp
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.cancer_mp
                                                ? form.errors?.cancer_mp
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Cáncer de mama Previo*"
                                        :items="[
                                            'NO',
                                            'CDIS',
                                            'CLIS',
                                            'DUCTAL INFILTRANTE',
                                            'LOBULAR INFILTRANTE',
                                            'OTROS',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.cancer_mp"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.lado_ta ? false : true
                                        "
                                        :error="
                                            form.errors?.lado_ta ? true : false
                                        "
                                        :error-messages="
                                            form.errors?.lado_ta
                                                ? form.errors?.lado_ta
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Lado del Tumor Anterior*"
                                        :items="[
                                            'NO CORRESPONDE',
                                            'IPSILATERAL',
                                            'CONTRALATERAL',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.lado_ta"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.cancer_olc
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.cancer_olc
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.cancer_olc
                                                ? form.errors?.cancer_olc
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Ha Tenido Cáncer en Algún Otro Lado del Cuerpo*"
                                        :items="[
                                            'NO',
                                            'CUELLO UTERINO',
                                            'OVARIO',
                                            'ENDOMETRIO',
                                            'COLON',
                                            'OTROS',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.cancer_olc"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.parientes_pgcm
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.parientes_pgcm
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.parientes_pgcm
                                                ? form.errors?.parientes_pgcm
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Cuántos Parientes en Primer Grado de Cáncer de Mama*"
                                        :items="[
                                            'NINGUNO',
                                            'UNO',
                                            'DOS',
                                            'MÁS DE DOS',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.parientes_pgcm"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.otros_pccm
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.otros_pccm
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.otros_pccm
                                                ? form.errors?.otros_pccm
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Otros Parientes con Cáncer de Mama*"
                                        :items="[
                                            'NINGUNO',
                                            'UNO',
                                            'DOS',
                                            'MÁS DE DOS',
                                        ]"
                                        required
                                        density="compact"
                                        v-model="form.otros_pccm"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.parientes_cco
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.parientes_cco
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.parientes_cco
                                                ? form.errors?.parientes_cco
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Parientes con Cáncer de Ovario*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.parientes_cco"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.parientes_ccc
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.parientes_ccc
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.parientes_ccc
                                                ? form.errors?.parientes_ccc
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Parientes con Cáncer de Colon*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.parientes_ccc"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.parientes_cce
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.parientes_cce
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.parientes_cce
                                                ? form.errors?.parientes_cce
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Parientes con Cáncer de Endometrio*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.parientes_cce"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12" sm="12" md="4" xl="3">
                                    <v-select
                                        :hide-details="
                                            form.errors?.parientes_cotc
                                                ? false
                                                : true
                                        "
                                        :error="
                                            form.errors?.parientes_cotc
                                                ? true
                                                : false
                                        "
                                        :error-messages="
                                            form.errors?.parientes_cotc
                                                ? form.errors?.parientes_cotc
                                                : ''
                                        "
                                        clearable
                                        variant="outlined"
                                        label="Parientes con Otros Tipos de Cáncer*"
                                        :items="['SI', 'NO']"
                                        required
                                        density="compact"
                                        v-model="form.parientes_cotc"
                                    ></v-select>
                                </v-col>
                                <v-col cols="12">
                                    <h4>Adjuntar estudios realizados</h4>
                                </v-col>
                                <v-col cols="12">
                                    <MiDropZone></MiDropZone>
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
#google_map {
    width: 100%;
    height: 500px;
}
</style>
