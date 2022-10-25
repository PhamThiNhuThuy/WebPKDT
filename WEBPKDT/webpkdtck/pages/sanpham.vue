<template>
  <main style="background-color: ghostwhite">
    <div class="py-5 bg-light text-center">
      <div>
        <b-tabs content-class="mt-3" align="center">
          <b-tab title="Phụ kiện điện thoại" active>
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listphukien"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
          <b-tab title="Kính cường lực ">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listkinhcuongluc"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
          <b-tab title="Màn hình điện thoại">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listmanhinhdienthoai"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
          <b-tab title="Ốp lưng">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listoplung"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
          <b-tab title="Tai nghe">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listtainghe"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
          <b-tab title="Sạc điện thoại">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listsacdienthoai"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>

          <b-tab title="Túi điện thoại chống nước">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listtuidienthoai"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>

          <b-tab title="Pin điện thoại">
            <div class="container">
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div
                  v-for="(sanpham, index) in listpindienthoai"
                  :key="index"
                  class="col-12 col-md-3 mb-3 text-center"
                >
                  <sanpham :sanpham="sanpham" />
                </div>
              </div>
            </div>
          </b-tab>
        </b-tabs>
      </div>
    </div>
  </main>
</template>
<script>
import sanpham from '@/components/Index/sanpham.vue'
import catalogApi from '@/api/catalogApi'
export default {
  components: { sanpham },
  layout: 'default',
  data() {
    return {
      danhmuc: [],
      listphukien: [],
      listkinhcuongluc: [],
      listmanhinhdienthoai: [],
      listoplung: [],
      listtainghe: [],
      listsacdienthoai: [],
      listtuidienthoai: [],
      listpindienthoai: [],
    }
  },
  async created() {
    await this.getDanhMuc()
    await this.getphukien()
    await this.getkinhcuongluc()
    await this.getmanhinhdienthoai()
    await this.getoplung()
    await this.gettainghe()
    await this.getsacdienthoai()
    await this.gettuidienthoai()
    await this.getpindienthoai()
  },
  mounted() {},
  methods: {
    async getDanhMuc() {
      try {
        const { data } = await catalogApi.getDanhMuc(this.$axios)
        console.log(data)
        this.danhmuc = data
      } catch (err) {
        console.log(err)
      }
    },

    async getphukien() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 1)
        this.listphukien = data
        console.log(this.listphukien)
      } catch (err) {
        console.log(err)
      }
    },

    async getkinhcuongluc() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 2)
        this.listkinhcuongluc = data
      } catch (err) {
        console.log(err)
      }
    },
    async getmanhinhdienthoai() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 3)
        this.listmanhinhdienthoai = data
      } catch (err) {
        console.log(err)
      }
    },
    async getoplung() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 4)
        this.listoplung = data
      } catch (err) {
        console.log(err)
      }
    },
    async gettainghe() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 5)
        this.listtainghe = data
      } catch (err) {
        console.log(err)
      }
    },
    async getsacdienthoai() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 6)
        this.listsacdienthoai = data
      } catch (err) {
        console.log(err)
      }
    },
    async gettuidienthoai() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 7)
        this.listtuidienthoai = data
      } catch (err) {
        console.log(err)
      }
    },

    async getpindienthoai() {
      try {
        const { data } = await catalogApi.getProductviaCateId(this.$axios, 8)
        this.listpindienthoai = data
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>
