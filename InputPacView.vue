<template>
  <div>

    <input v-model="documento" placeholder="Ingrese su documento" />
    <button @click="redirigir">OK</button>
    <table v-show="Object.keys(paciente).length > 0" class="styled-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Documento</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Edad</th>
          <th>Género</th>
          <th>EPS</th>
          <th>TP</th>
          <th>PTT</th>
          <th>AT_lll</th>
          <th>TT</th>
          <th>Fibrinogeno</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="result in paciente" :key="result.doc">
          <td>{{ result.id }}</td>
          <td>{{ result.doc }}</td>
          <td>{{ result.name }}</td>
          <td>{{ result.lastname }}</td>
          <td>{{ result.age }}</td>
          <td>{{ result.gender }}</td>
          <td>{{ result.EPS }}</td>
          <td>{{ result.TP }}</td>
          <td>{{ result.PTT }}</td>
          <td>{{ result.AT_lll }}</td>
          <td>{{ result.TT }}</td>
          <td>{{ result.fibrinogeno }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
export default {
  data() {
    return {
      paciente: {},
      documento: "",
      showWarning: false,
    };
  },
  methods: {
    async redirigir() {
      if (this.documento) {
        try {
          const url = `http://localhost/api/?documento=${this.documento}`;
          const response = await fetch(url);

          if (response.ok) {
            this.paciente = await response.json();
            if (Object.keys(this.paciente).length === 0) {
              this.showWarning = true;
            } else {
              this.showWarning = false; // Restablecer la advertencia si se recibe una respuesta válida.
            }
          } else {
            console.error("No se pudo realizar la solicitud a la URL.");
            this.showWarning = false; // Restablecer la advertencia en caso de un error en la solicitud.
          }
        } catch (error) {
          console.error(error);
          this.showWarning = false; // Restablecer la advertencia en caso de error.
        }
      } else {
        this.showWarning = false; // Restablecer la advertencia si el usuario no ingresó un documento.
      }
    },
  },
};
</script>

<style>
.styled-table {
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  text-align: center;
  margin: 20px auto;
  border: 2px solid #ccc;
  border-radius: 8px;
}

.styled-table th, .styled-table td {
  border: 1px solid #ccc;
  padding: 8px;
}

.styled-table th {
  background-color: #f2f2f2;
}
</style>