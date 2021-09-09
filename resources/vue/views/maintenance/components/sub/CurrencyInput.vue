<template>
  <input 
    ref="inputRef"
    type="text"
    :value="formattedValue"
  >
</template>

<script>
import { useCurrencyInput } from 'vue-currency-input'

export default {
  name: 'CurrencyInput',
  props: {
    modelValue: Number, // Vue 2: value
    options: Object
  },
  setup (props) {
    const { formattedValue, inputRef } = useCurrencyInput(props.options)

    return { inputRef, formattedValue }
  }
}
</script>