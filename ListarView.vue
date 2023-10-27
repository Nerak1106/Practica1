<template>
    <div class="container">
        <div class="card">
            <div class="card-header1 text-center">
                Lista Pacientes
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DOCUMENTO</th>
                            <th>NOMBRE COMPLETO</th>
                            <th class="text-center">ACCIONES</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="paciente in pacientes" :key="paciente.id">
                            <td scope="row">{{paciente.id}}</td>
                            <td>{{paciente.doc}}</td>
                            <td>{{paciente.name}} {{paciente.lastname}}</td>
                            <td class="text-center"> 
                                <div class="btn-group" role="group" aria-label="">
                                    <router-link :to="{name:'examenes', params:{id:paciente.id}}" class="btn btn-outline mx-2 custom-button">Resultados</router-link>
                                    <router-link :to="{name:'editar', params:{id:paciente.id}}" class="btn btn-outline mx-2 custom-button-editar"><i class="bi bi-pencil"></i> </router-link>
                                    <button type="button" v-on:click="borrarPaciente(paciente.id)" class="btn btn-outline mx-2 custom-button-borrar"><i class="bi bi-trash"></i> </button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
        return {
            pacientes:[]
        }
    },
    created:function(){
        this.consultarPacientes();
    },
    methods:{
        //http://localhost/api/
        consultarPacientes(){
            fetch('http://localhost/api/')
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                this.pacientes=[]
                if(typeof datosRespuesta[0].success==='undefined'){
                    this.pacientes=datosRespuesta;
                }

            })
            .catch(console.log)
        },
        borrarPaciente(id){
            console.log(id)
            //http://localhost/api/?borrar=
            fetch('http://localhost/api/?borrar='+id)
            .then(respuesta=>respuesta.json())
            .then((datosRespuesta)=>{
                console.log(datosRespuesta)
                window.location.href="listar"

            })
            .catch(console.log)
        }

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
  }
  
  .custom-button:hover {
    border: 1px solid #40AEB3;; 
    color: #40AEB3; 
  }

  .custom-button-editar{
    background-color: transparent; 
    border: 1px solid #060707; 
    color: #060707; 
    transition: background-color 0.3s; 
    cursor: pointer; 
  }
  .custom-button-editar:hover {
    border: 1px solid #40B390;
    color: #40B390; 
  }
  .custom-button-borrar{
    background-color: transparent; 
    border: 1px solid #060707; 
    color: #060707; 
    transition: background-color 0.3s; 
    cursor: pointer; 
  }
  .custom-button-borrar:hover {
    border: 1px solid #D6534D;
    color: #D6534D; 
  }

  .card-header{
    background: #8FD6C8;
    color: #000000;
  }

  .card-header1 { 
    background: #8FD6C8;
    color: #000000;
    padding: 1rem; 
    margin: 0;
    max-height: 50px; 
  }


</style>
