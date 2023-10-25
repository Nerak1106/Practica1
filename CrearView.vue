<template>
    <div class="container">

        <div class="card-body">
            <form v-on:submit.prevent="agregarRegistro">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <p class="text-center"><b>INFORMACION PERSONAL DEL PACIENTE</b></p>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="doc">Documento de identidad:</label>
                                <input type="text" class="form-control" name="doc" v-model="paciente.doc" id="doc"
                                    placeholder="Ingrese el documento del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="name">Nombre:</label>
                                <input type="text" class="form-control" name="name" v-model="paciente.name" id="name"
                                    placeholder="Ingrese el nombre del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="lastname">Apellidos:</label>
                                <input type="text" class="form-control" name="lastname" v-model="paciente.lastname"
                                    id="lastname" placeholder="Ingrese el apellido del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="age">Edad:</label>
                                <input type="text" class="form-control" name="age" v-model="paciente.age" id="age"
                                    placeholder="Ingrese la edad del paciente">
                            </div>
                            <p></p>
                            <label for="age">Genero:</label>
                            <select class="form-select" name="gender" v-model="paciente.gender" id="gender">
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <p></p>
                            <label for="age">EPS:</label>
                            <select class="form-select" name="EPS" v-model="paciente.EPS" id="EPS">
                                <option value="Nueva EPS">Nueva EPS</option>
                                <option value="Sura">Sura</option>
                                <option value="Sanitas">Sanitas</option>
                                <option value="Salud Total">Salud Total</option>
                                <option value="Compensar">Compensar</option>
                                <option value="Coomeva EPS">Coomeva EPS</option>

                            </select>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <p class="text-center"><b>PRUEBAS DE COAGULACIÓN</b></p>
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="TP">Tiempo de protombina:</label>
                                <input type="text" class="form-control" name="TP" v-model="paciente.TP" id="TP"
                                    placeholder="Ingrese el tiempo de Protombina del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="PTT">Tiempo de Tromboplastina Parcial:</label>
                                <input type="text" class="form-control" name="PTT" v-model="paciente.PTT" id="PTT"
                                    placeholder="Ingrese el tiempo de Tromboplastina Parcial del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="AT_lll">Antitrombina III:</label>
                                <input type="text" class="form-control" name="AT_lll" v-model="paciente.AT_lll" id="AT_lll"
                                    placeholder="Ingrese el resultado de Antitrombina III del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="TT">Tiempo de Trombina:</label>
                                <input type="text" class="form-control" name="TT" v-model="paciente.TT" id="TT"
                                    placeholder="Ingrese el Tiempo de Trombina del paciente">
                            </div>
                            <p></p>
                            <div class="form-group">
                                <label for="fibrinogeno">Fibrinogeno:</label>
                                <input type="text" class="form-control" name="fibrinogeno" v-model="paciente.fibrinogeno"
                                    id="fibrinogeno" placeholder="Ingrese el resultado de fibrinogeno del paciente">
                            </div>
                            <p></p>
                        </div>

                    </div>


                </div>
                <p></p>
                <div class="d-grid gap-2 col-4 mx-auto" role="group" aria-label="">
                    <button type="submit" class="btn btn-outline-primary ">Enviar</button>
                    <button type="reset" class="btn btn-outline-danger ">Borrar</button>

                </div>
            </form>
        </div>

        <div class="card-footer text-muted">
            Copyright: Biologic
        </div>

    </div>
</template>

<script>
export default {
    data() {
        return {
            paciente: {}
        }
    },
    methods: {
        agregarRegistro() {
            console.log(this.paciente)
            let datosEnviar = { id: null, doc: this.paciente.doc, name: this.paciente.name, lastname: this.paciente.lastname, age: this.paciente.age, gender: this.paciente.gender, EPS: this.paciente.EPS, TP: this.paciente.TP, PTT: this.paciente.PTT, AT_lll: this.paciente.AT_lll, TT: this.paciente.TT, fibrinogeno: this.paciente.fibrinogeno }
            fetch('http://localhost/api/?insertar=1', {
                method: "POST",
                body: JSON.stringify(datosEnviar)
            })
                .then(respuesta => respuesta.json())
                .then((datosRespuesta => {
                    console.log(datosRespuesta);
                    window.location.href = 'listar' //Redirecciona a la ruta listar
                }))
        }
    }
}
</script>