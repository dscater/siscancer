import axios from "axios";
import { onMounted, reactive } from "vue";
import { usePage } from "@inertiajs/vue3";

const oDiagnostico = reactive({
    id: 0,
    paciente_id: null,
    imagen1: "",
    imagen2: "",
    diagnostico: "",
    descripcion: "",
    fecha_diagnostico: "",
    // appends
    url_imagen1: "",
    url_imagen2: "",
    _method: "POST",
});

export const useDiagnosticos = () => {
    const { flash } = usePage().props;
    const getDiagnosticos = async () => {
        try {
            const response = await axios.get(route("diagnosticos.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.diagnosticos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const getDiagnosticosApi = async (data) => {
        try {
            const response = await axios.get(
                route("diagnosticos.paginado", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            return response.data.diagnosticos;
        } catch (err) {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: `${
                    flash.error
                        ? flash.error
                        : err.response?.data
                        ? err.response?.data?.message
                        : "Hay errores en el formulario"
                }`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            throw err; // Puedes manejar el error según tus necesidades
        }
    };
    const saveDiagnostico = async (data) => {
        try {
            const response = await axios.post(
                route("diagnosticos.store", data),
                {
                    headers: { Accept: "application/json" },
                }
            );
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
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
            console.error("Error:", err);
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const deleteDiagnostico = async (id) => {
        try {
            const response = await axios.delete(
                route("diagnosticos.destroy", id),
                {
                    headers: { Accept: "application/json" },
                }
            );
            Swal.fire({
                icon: "success",
                title: "Correcto",
                text: `${flash.bien ? flash.bien : "Proceso realizado"}`,
                confirmButtonColor: "#3085d6",
                confirmButtonText: `Aceptar`,
            });
            return response.data;
        } catch (err) {
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
            console.error("Error:", err);
            throw err; // Puedes manejar el error según tus necesidades
        }
    };

    const setDiagnostico = (item = null) => {
        if (item) {
            oDiagnostico.id = item.id;
            oDiagnostico.paciente_id = item.paciente_id;
            oDiagnostico.imagen1 = item.imagen1;
            oDiagnostico.imagen2 = item.imagen2;
            oDiagnostico.diagnostico = item.diagnostico;
            oDiagnostico.descripcion = item.descripcion;
            oDiagnostico.fecha_diagnostico = item.fecha_diagnostico;
            // appends
            oDiagnostico.url_imagen1 = item.url_imagen1;
            oDiagnostico.url_imagen2 = item.url_imagen2;
            oDiagnostico._method = "PUT";
            return oDiagnostico;
        }
        return false;
    };

    const limpiarDiagnostico = () => {
        oDiagnostico.id = 0;
        oDiagnostico.paciente_id = null;
        oDiagnostico.imagen1 = "";
        oDiagnostico.imagen2 = "";
        oDiagnostico.diagnostico = "";
        oDiagnostico.descripcion = "";
        oDiagnostico.fecha_diagnostico = "";
        // appends
        oDiagnostico.url_imagen1 = "";
        oDiagnostico.url_imagen2 = "";
        oDiagnostico._method = "POST";
    };

    onMounted(() => {});

    return {
        oDiagnostico,
        getDiagnosticos,
        getDiagnosticosApi,
        saveDiagnostico,
        deleteDiagnostico,
        setDiagnostico,
        limpiarDiagnostico,
    };
};
