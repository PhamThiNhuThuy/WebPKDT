<template>
  <div>
    <!-- User Component -->
    <Header />

    <Nuxt />

    <Footer />
  </div>
</template>

<script>
// import components
import Header from '@/components/Shared/Header.vue'
import Footer from '@/components/Shared/Footer.vue'

export default {
  name: 'Default',

  // decleare component (khai báo)
  components: {
    Header,
    Footer,
  },
}
</script>
