<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Resultados
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Tiempo de Protrombina (TP)</th>
                            <th>Tiempo de Tromboplastina Parcial (PTT)</th>
                            <th>Antitrombina III (AT III)</th>
                            <th>Tiempo de Trombina (TT)</th>
                            <th>Fibrinógeno</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{ paciente.TP }}</td>
                            <td>{{ paciente.PTT }}</td>
                            <td>{{ paciente.AT_lll }}</td>
                            <td>{{ paciente.TT }}</td>
                            <td>{{ paciente.fibrinogeno }}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-group" role="group" aria-label="">
                    <router-link :to="{ name: 'lista' }" class="btn btn-outline mx-2 custom-button">Volver</router-link>
                </div>
            </div>
            <div class="card-footer text-muted">
                Copyright: BioLogic Company 2023
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            paciente: {} // Almacena la información del paciente
        }
    },
    created() {
        this.obtenerInformacionID(this.$route.params.id);
    },
    methods: {
        obtenerInformacionID(id) {
            fetch(`http://localhost/api/?consultar=${id}`)
                .then(respuesta => respuesta.json())
                .then(datosRespuesta => {
                    console.log(datosRespuesta);
                    this.paciente = datosRespuesta[0];
                })
                .catch(console.log)
        },
    }
}
</script>

<style scoped>
.custom-button {
    background-color: transparent;
    border: 1px solid #060707;
    color: #060707;
    transition: background-color 0.3s;
    cursor: pointer;
    display: block; /* Establecer como bloque para forzar el salto de línea */
    margin-top: 10px; /* Espacio superior para separar el botón de la tabla */
}
  
  .custom-button:hover {
    border: 1px solid #30B085;; 
    color: #30B085; 
  }
  .card-header{
    background: #8FD6C8;
    color: #000000;
  }
</style>