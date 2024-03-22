import axios from "axios";
import { onMounted, reactive } from "vue";
import { usePage } from "@inertiajs/vue3";

const oDoctor = reactive({
    id: 0,
    user_id: "",
    fecha_nac: "",
    estado_civil: "",
    sexo: "",
    especialidad: "",
    fono2: "",
    // usuario
    nombre: "",
    paterno: "",
    materno: "",
    ci: "",
    ci_exp: "",
    dir: "",
    email: "",
    fono: "",
    tipo: "",
    foto: "",
    acceso: 0 + "",
    _method: "POST",
});

export const useDoctors = () => {
    const { flash } = usePage().props;
    const getDoctors = async () => {
        try {
            const response = await axios.get(route("doctors.listado"), {
                headers: { Accept: "application/json" },
            });
            return response.data.doctors;
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

    const getDoctorsApi = async (data) => {
        try {
            const response = await axios.get(route("doctors.paginado", data), {
                headers: { Accept: "application/json" },
            });
            return response.data.doctors;
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
    const saveDoctor = async (data) => {
        try {
            const response = await axios.post(route("doctors.store", data), {
                headers: { Accept: "application/json" },
            });
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

    const deleteDoctor = async (id) => {
        try {
            const response = await axios.delete(route("doctors.destroy", id), {
                headers: { Accept: "application/json" },
            });
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

    const setDoctor = (item = null) => {
        if (item) {
            oDoctor.id = item.id;
            oDoctor.user_id = item.user_id;
            oDoctor.fecha_nac = item.fecha_nac;
            oDoctor.estado_civil = item.estado_civil;
            oDoctor.sexo = item.sexo;
            oDoctor.especialidad = item.especialidad;
            oDoctor.fono2 = item.fono2;
            // usuario
            oDoctor.nombre = item.user.nombre;
            oDoctor.paterno = item.user.paterno;
            oDoctor.materno = item.user.materno;
            oDoctor.ci = item.user.ci;
            oDoctor.ci_exp = item.user.ci_exp;
            oDoctor.dir = item.user.dir;
            oDoctor.email = item.user.email;
            oDoctor.fono = item.user.fono;
            oDoctor.tipo = item.user.tipo;
            oDoctor.foto = item.user.foto;
            oDoctor.acceso = item.user.acceso + "";
            oDoctor._method = "PUT";
            return oDoctor;
        }
        return false;
    };

    const limpiarDoctor = () => {
        oDoctor.id = 0;
        oDoctor.user_id = "";
        oDoctor.fecha_nac = "";
        oDoctor.estado_civil = "";
        oDoctor.sexo = "";
        oDoctor.especialidad = "";
        oDoctor.fono2 = "";
        // usuario
        oDoctor.nombre = "";
        oDoctor.paterno = "";
        oDoctor.materno = "";
        oDoctor.ci = "";
        oDoctor.ci_exp = "";
        oDoctor.dir = "";
        oDoctor.email = "";
        oDoctor.fono = "";
        oDoctor.tipo = "";
        oDoctor.foto = "";
        oDoctor.acceso = 0 + "";
        oDoctor._method = "POST";
    };

    onMounted(() => {});

    return {
        oDoctor,
        getDoctors,
        getDoctorsApi,
        saveDoctor,
        deleteDoctor,
        setDoctor,
        limpiarDoctor,
    };
};
