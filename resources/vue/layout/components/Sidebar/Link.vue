
<template>
  <!-- eslint-disable vue/require-component-is-->
  <component v-bind="linkProps(to)" @click="change">
    <slot />
  </component>
</template>

<script>
import { isExternal } from '@/utils/validate';

export default {
  props: {
    to: {
      type: String,
      required: true,
    },
  },
  methods: {
    isExternalLink(routePath) { 
      return isExternal(routePath);
    },
    linkProps(url) {

      if (this.isExternalLink(url)) {

        return {
          is: 'a',
          // href: '../logout',
          // target: '_blank',
          rel: 'noopener',
        };
      }
      return {
        is: 'router-link',
        to: url,
      };
    },
    change() {
      if(confirm('ログアウトしますか？')) {
        document.getElementById('logout-form').submit();
      } else {
        return;
      }
    },
  },
};
</script>
