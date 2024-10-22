<template>
  <div>
    <h2>Add Income</h2>
    <form @submit.prevent="addIncome">
      <label for="name">Income Name:</label>
      <input v-model="name" id="name" />

      <label for="amount">Amount:</label>
      <input v-model="amount" id="amount" type="number" />

      <label for="type">Type:</label>
      <select v-model="type">
        <option v-for="option in incomeTypes" :key="option">
          {{ option }}
        </option>
      </select>

      <button type="submit">Add Income</button>
    </form>

    <div v-if="incomes.length">
      <h3>Incomes List</h3>
      <ul>
        <li v-for="income in incomes" :key="income.id">
          {{ income.name }}: {{ income.amount }} EUR ({{ income.type }})
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
      type: "Salary",
      incomeTypes: ["Salary", "Rent", "Other"],
      incomes: [],
    };
  },
  methods: {
    async addIncome() {
      try {
        const response = await axios.post("http://localhost:4567/income", {
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
      this.type = "Salary";
    },
  },
};
</script>
