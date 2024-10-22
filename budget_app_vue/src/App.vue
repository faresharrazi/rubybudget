<template>
  <div id="app">
    <IncomeSource />
    <OutcomeDetails />
    <AccountDetails />
  </div>
</template>

<script>
import IncomeSource from "./components/IncomeSource.vue";
import OutcomeDetails from "./components/OutcomeDetails.vue";
import AccountDetails from "./components/AccountDetails.vue";

export default {
  components: {
    IncomeSource,
    OutcomeDetails,
    AccountDetails,
  },
};
</script>
