<template>
  <main style="background-color: ghostwhite">
    <div class="container">
      <div>
        <b-carousel
          id="carousel-no-animation"
          style="text-shadow: 0px 0px 2px #000"
          no-animation
          indicators
          img-width="1024"
          img-height="280"
        >
          <b-carousel-slide
            img-src="@/img/slider/slider1.jpg"
          ></b-carousel-slide>
          <b-carousel-slide
            img-src="@/img/slider/slider2.jpg"
          ></b-carousel-slide>
          <b-carousel-slide
            img-src="@/img/slider/slider3.jpg"
          ></b-carousel-slide>
          <b-carousel-slide
            img-src="@/img/slider/slider4.jpg"
          ></b-carousel-slide>
          <b-carousel-slide
            img-src="@/img/slider/slider5.jpg"
          ></b-carousel-slide>
        </b-carousel>
      </div>
    </div>
    <marquee behavior="scroll" direction="">
      <p style="font-size: 24px">
        <strong>
          <i class="fas fa-bullhorn" style="color: red; font-size: 30px"></i>
          Cửa hàng phụ kiện điện thoại TNANT xin kính chào quý khách!
          <i class="fas fa-bullhorn" style="color: red; font-size: 30px"></i>
        </strong>
      </p>
    </marquee>
    <div class="py-5 bg-light">
      <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          <div
            v-for="(trangchu, index) in listTrangChu"
            :key="index"
            class="col-12 col-md-3 mb-3 text-center"
          >
            <trangchu :trangchu="trangchu" />
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
import trangchu from '@/components/Index/trangchu.vue'
import catalogApi from '@/api/catalogApi'
export default {
  components: { trangchu },
  layout: 'default',
  data() {
    return {
      listTrangChu: [],
      danhmuc: [],
    }
  },
  async created() {
    await this.getAllTrangChu()
  },
  mounted() {},
  methods: {
    async getAllTrangChu() {
      try {
        const { data } = await catalogApi.getTrangChu(this.$axios)
        console.log(data)
        this.listTrangChu = data
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>
