<template>
    <div class="container">
      <div class="card">
        <div class="card-header1 text-center">
          <b>Editar Paciente</b>
        </div>
        <div class="card-body" style="margin-top: 20px;">
        <form v-on:submit.prevent="actualizarRegistro">
          <div class="row">
            <div class="col-md-6">
              <div class="card">
                <div class="card-header">
                  <p class="text-center"><b>INFORMACION PERSONAL DEL PACIENTE</b></p>
                </div>
                
                <p></p>
                <div class="form-container">
                <div class="form-group">
                  <label for="doc">Documento de identidad:</label>
                  <input type="text" class="form-control" name="doc" v-model="paciente.doc" id="doc"
                    placeholder="Ingrese el documento del paciente">
                </div>
                <p></p>
                <div class="form-group">
                  <label for="name">Nombre:</label>
                  <input type text class="form-control" name="name" v-model="paciente.name" id="name"
                    placeholder="Ingrese el nombre del paciente">
                </div>
                <p></p>
                <div class="form-group">
                  <label for="lastname">Apellidos:</label>
                  <input type text class="form-control" name="lastname" v-model="paciente.lastname" id="lastname"
                    placeholder="Ingrese el apellido del paciente">
                </div>
                <p></p>
                <div class="form-group">
                  <label for="age">Edad:</label>
                  <input type text class="form-control" name="age" v-model="paciente.age" id="age"
                    placeholder="Ingrese la edad del paciente">
                </div>
                <p></p>
                <label for="age">Género:</label>
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
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-header">
                  <p class="text-center"><b>PRUEBAS DE COAGULACIÓN</b></p>
                </div>
                <p></p>
                <div class="form-group">
                  <label for="TP">Tiempo de protrombina:</label>
                  <input type="text" class="form-control" name="TP" v-model="paciente.TP" id="TP"
                    placeholder="Ingrese el tiempo de Protrombina del paciente">
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
                  <label for="fibrinógeno">Fibrinógeno:</label>
                  <input type="text" class="form-control" name="fibrinogeno" v-model="paciente.fibrinogeno"
                    id="fibrinogeno" placeholder="Ingrese el resultado de fibrinógeno del paciente">
                </div>
                <p></p>
              </div>
            </div>
          </div>
          
          <div class="row mt-3">
            <div class="col-md-12">
              <div class="button-container"></div>
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-outline mx-2 custom-button">Modificar</button>
                  <router-link
                    :to="{ name: 'lista', params: { id: paciente.id } }"
                    class="btn btn-outline mx-2 custom-button custom-button-borrar"
                  >
                    Cancelar
                  </router-link>
                </div>
            </div>
            </div>
          </form>
        </div>
        
        <div class="card-footer text-muted">
          Copyright: BioLogic Company 2023
        </div>
      </div>
    </div>
  </template>

<script>
export default {
    data(){
        return{
            paciente:{}
        }
    },
    created:function(){
        this.obtenerInformacionID();
    },
    methods:{
        
        obtenerInformacionID(){
            fetch('http://localhost/api/?consultar='+this.$route.params.id)
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                this.paciente=datosRespuesta[0];

            })
            .catch(console.log)
        },
        actualizarRegistro(){
            let datosEnviar={id:this.$route.params.id , doc:this.paciente.doc , name:this.paciente.name , lastname:this.paciente.lastname, age: this.paciente.age,
                gender: this.paciente.gender,
                EPS: this.paciente.EPS,
                TP: this.paciente.TP,
                PTT: this.paciente.PTT,
                AT_lll: this.paciente.AT_lll,
                TT: this.paciente.TT,
                fibrinogeno: this.paciente.fibrinogeno}
                fetch('http://localhost/api/?actualizar='+this.$route.params.id ,{
                method:"POST",
                body:JSON.stringify(datosEnviar)
            })
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta=>{
                console.log(datosRespuesta);
                window.location.href='../listar' //Redirecciona a la ruta listar
            })) 
        }
    }

}
</script>
<style scoped>
.card-header1 { 
  background: #8FD6C8;
  color: #000000;
  padding: 1rem; 
  margin: 0; 
  max-height: 50px; 
}
.custom-button {
    background-color: transparent; 
    border: 1px solid #060707; 
    color: #060707; 
    transition: background-color 0.3s; 
    cursor: pointer; 
  }
  
  .custom-button:hover {
    border: 1px solid #40B390;; 
    color: #40B390; 
  }

  .custom-button-borrar {
    background-color: transparent; 
    border: 1px solid #060707; 
    color: #060707; 
    transition: background-color 0.3s; 
    cursor: pointer; 
  }
  
  .custom-button-borrar:hover {
    border: 1px solid #40B369;; 
    color: #40B369; 
  }

  .card-header1 { 
    background: #8FD6C8;
    color: #000000;
    padding: 1rem; 
    margin: 0; 
    max-height: 50px; 
  }

  .button-container {
    margin-top: -60px; 
  }

  input[type="text"],
  select {
      width: 100%; 
      padding: 5px; 
      font-size: 14px; 
      
  }
  
  
  select {
      height:30px;
      font-size: 14px; 
  }



</style>
