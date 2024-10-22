<template>
  <div id="app">
    <Income />
    <Outcome />
    <Account />
  </div>
</template>

<script>
import Income from "./components/Income.vue";
import Outcome from "./components/Outcome.vue";
import Account from "./components/Account.vue";

export default {
  components: {
    Income,
    Outcome,
    Account,
  },
};
</script>
