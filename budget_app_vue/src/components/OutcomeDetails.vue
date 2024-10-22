<template>
  <div>
    <h2>Add Outcome</h2>
    <form @submit.prevent="addOutcome">
      <label for="name">Outcome Name:</label>
      <input v-model="name" id="name" />

      <label for="amount">Amount:</label>
      <input v-model="amount" id="amount" type="number" />

      <label for="type">Type:</label>
      <select v-model="type">
        <option v-for="option in outcomeTypes" :key="option">
          {{ option }}
        </option>
      </select>

      <button type="submit">Add Outcome</button>
    </form>

    <div v-if="outcomes.length">
      <h3>Outcomes List</h3>
      <ul>
        <li v-for="outcome in outcomes" :key="outcome.id">
          {{ outcome.name }}: {{ outcome.amount }} EUR ({{ outcome.type }})
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      name: "",
      amount: 0,
      type: "Loan",
      outcomeTypes: ["Loan", "Credit Card", "Other"],
      outcomes: [],
    };
  },
  methods: {
    async addOutcome() {
      try {
        const response = await axios.post("http://localhost:4567/outcome", {
          name: this.name,
          amount: this.amount,
          type: this.type,
        });
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
      // Reset form
      this.name = "";
      this.amount = 0;
      this.type = "Loan";
    },
  },
};
</script>
