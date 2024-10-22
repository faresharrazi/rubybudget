<template>
  <div>
    <h2>Accounts</h2>
    <ul>
      <li v-for="account in accounts" :key="account.name">
        {{ account.name }}: {{ account.amount }} EUR (Fraction:
        {{ account.fraction }})
      </li>
    </ul>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      accounts: [],
    };
  },
  mounted() {
    this.fetchAccounts();
  },
  methods: {
    async fetchAccounts() {
      try {
        const response = await axios.get("http://localhost:4567/accounts");
        this.accounts = response.data;
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>
