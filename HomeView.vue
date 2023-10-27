<template>
  <div class="home">
    <div class="content">
      <div class="left-container">
        <img alt="Imagen izquierda" src="@/assets/doctor2.png">
      </div>
      <div class="center-container">
        <img alt="Vue logo" src="@/assets/logo6.png">
        <HelloWorld msg="Bienvenidos al laboratorio BioLogic" />
      </div>
    </div>
  </div>
</template>



<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'HomeView',
  components: {
    HelloWorld
  }
}
</script>
<style>
.home {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.content {
  display: flex;
  align-items: center;
}

.left-container {
  flex: 1;
  padding: 20px;
  text-align: center;
}

.center-container {
  flex: 1;
  padding: 20px;
  text-align: center;
}
</style>
