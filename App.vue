<template>
<div class="container">
  <nav class="navbar navbar-expand navbar-light bg-light">
      <div class="nav navbar-nav">
          
          <router-link to="/crear" class="navbar-brand">Crear</router-link> 
          <router-link to="/listar" class="navbar-brand">Listar</router-link>      
      </div>
  </nav>
</div>
<br>
  <router-view/>
</template>


