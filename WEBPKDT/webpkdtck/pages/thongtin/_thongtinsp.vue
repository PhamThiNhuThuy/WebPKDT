<template>
  <main style="background: seashell">
    <div class="container">
      <div class="row">
        <div v-bind="sanpham.tensanpham" :key="index" class="text-center">
          <div class="col-md-12 breadcrumb">
            <h5 style="padding-right: 560px">
              {{ sanpham.tensanpham }}
            </h5>
          </div>
          <hr />
          <div class="row">
            <div class="col-md-8 order-md-1">
              <img
                :src="sanpham.hinhanh"
                class="img-fluid"
                style="width: 450px"
                alt=""
              />
            </div>

            <div class="col-md-4 order-md-2 mb-4">
              <h4
                class="card-title pricing-card-title"
                style="margin-right: 216px; color: #d0021c"
              >
                {{ sanpham.giasp }} &#x20AB;
              </h4>
              <i class="pr-txt">{{ sanpham.tomtat }}</i>

              <h5
                v-if="sanpham.tinhtrang > 0"
                class="mb-3 mt-3"
                style="color: #219653; margin-right: 225px"
              >
                CÒN HÀNG
              </h5>
              <h5
                v-else
                class="mb-3 mt-3"
                style="color: #6c757d; margin-right: 225px"
              >
                HẾT HÀNG
              </h5>
              <input
                v-if="sanpham.tinhtrang > 0"
                v-model="quantity"
                type="text"
                name="quantity"
                placeholder="Nhập số lượng"
              />

              <div class="btn-group" style="width: 100%; margin-top: 16px">
                <form
                  v-if="sanpham.tinhtrang > 0"
                  action=""
                  style="width: 100%"
                  @submit.prevent="AddCart(sanpham)"
                >
                  <button
                    type="submit"
                    class="btn"
                    style="width: 100%; background-color: #fb6e2e; color: #fff"
                  >
                    MUA NGAY
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  methods: {
    async AddCart(sanpham) {
      if (this.quantity < 1) {
        alert('Vui lòng nhập số lương trước khi mua hàng!')
      } else {
        try {
          await this.$axios.post('/api/Catalog/add-cart', {
            id_sanpham: sanpham.id_sanpham,
            tensanpham: sanpham.tensanpham,
            masp: sanpham.masp,
            giasp: sanpham.giasp,
            soluong: this.quantity,
            hinhanh: sanpham.hinhanh,
            tomtat: sanpham.tomtat,
            tinhtrang: sanpham.tinhtrang,
            id_danhmuc: sanpham.id_danhmuc,
            tongtien: sanpham.giasp * this.quantity,
          })
          alert('Thêm vào giỏ hàng thành công.')
          this.$router.push(`/giohang`)
        } catch (e) {
          this.error = e.response.data.messages
        }
      }
    },
  },

  async asyncData({ $axios, params }) {
    const sanpham = await $axios.$get(
      `/api/Catalog/sanpham-by-danhmuc/${params.thongtinsp}`
    )
    console.log(sanpham)
    return { sanpham }
  },
}
</script>