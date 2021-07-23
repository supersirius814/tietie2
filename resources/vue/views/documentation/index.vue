<template>
  <div class="app-container documentation-container">
    <h1>開発中です。</h1>
  </div>
</template>
<script>

export default {
  name: 'Documentation',
  data() {
    return {
      articleList: [
        { title: 'Laravel Envoy', href: 'https://laravel.com/docs/5.8/envoy' },
        { title: 'Vuex', href: 'https://vuex.vuejs.org/' },
        { title: 'Vue Router', href: 'https://router.vuejs.org/' },
        { title: 'laravue-core', href: 'https://github.com/tuandm/laravue-core' },
        { title: 'vue-admin-template', href: 'https://github.com/PanJiaChen/vue-admin-template' },
        { title: 'Axios', href: 'https://github.com/axios/axios' },
      ],
    };
  },
};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.documentation-container {
  margin: 50px;
  .document-btn {
    float: left;
    margin-left: 50px;
    display: block;
    cursor: pointer;
    background: black;
    color: white;
    height: 60px;
    width: 200px;
    line-height: 60px;
    font-size: 20px;
    text-align: center;
  }
}
</style>
