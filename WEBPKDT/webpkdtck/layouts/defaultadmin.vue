<template>
  <div>
    <!-- User Component -->
    <HeaderAdmin />

    <Nuxt />

    <Footer />
  </div>
</template>
<script>
// import components
import HeaderAdmin from '@/components/Shared/HeaderAdmin.vue'
import Footer from '@/components/Shared/Footer.vue'

export default {
  name: 'Defaultadmin',

  // decleare component (khai báo)
  components: {
    HeaderAdmin,
    Footer,
  },
}
</script>