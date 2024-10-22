<template>
  <div>
    <h2>Accounts</h2>
    <ul>
      <li v-for="account in accounts" :key="account.id">
        {{ account.name }}: {{ account.amount }} EUR (Fraction:
        {{ account.fraction }})
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "AccountDetails",
  data() {
    return {
      accounts: [
        { id: 1, name: "Necessities", amount: 500, fraction: 0.5 },
        { id: 2, name: "Savings", amount: 200, fraction: 0.2 },
        { id: 3, name: "Investments", amount: 300, fraction: 0.3 },
      ],
    };
  },
};
</script>
