<template>
  <div class="container" style="background: aliceblue">
    <div class="py-5 text-center">
      <h2>Thanh toán</h2>
    </div>

    <div class="row">
      <div class="col-md-8 order-md-1">
        <h4 class="mb-3">Thông tin nhận hàng</h4>
        <form class="needs-validation" @submit.prevent="DatHang">
          <div class="mb-3">
            <label for="hotenkh">Họ tên người nhận</label>
            <input
              v-model="tenkhachhang"
              type="text"
              class="form-control"
              id="hotenkh"
              placeholder="Nhập họ tên người nhận"
            />
          </div>

          <div class="mb-3">
            <label for="sdt">Số điện thoại</label>
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text"
                  ><svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-telephone"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"
                    /></svg
                ></span>
              </div>
              <input
                v-model="dienthoai"
                type="text"
                class="form-control"
                id="sdt"
                placeholder="Nhập số điện thoại"
                required
              />
            </div>
          </div>

          <div class="mb-3">
            <label for="address">Địa chỉ</label>
            <input
              v-model="diachi"
              type="text"
              class="form-control"
              id="address"
              placeholder="Nhập địa chỉ"
              required
            />
            <div class="invalid-feedback">
              Please enter your shipping address.
            </div>
          </div>
          <div class="row">
            <div class="col-md-5 mb-3">
              <label for="country">Chọn phương thức thanh toán</label>
              <select
                v-model="phuongthucthanhtoan"
                class="custom-select d-block w-100"
                id="country"
                required
              >
                <option>Thanh toán bằng tiền mặt</option>
                <option>InternetBanking</option>
                <option>VisaCard</option>
                <option>Paypal</option>
              </select>
              <div class="invalid-feedback">Please select a valid country.</div>
            </div>
          </div>
          <hr class="mb-4" />

          <button class="btn btn-primary btn-lg btn-block" type="submit">
            Đặt hàng
          </button>
        </form>
      </div>

      <div class="col-md-4 order-md-2 mb-4">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-muted">Bạn vừa mua</span>
          <span class="badge badge-secondary badge-pill">{{ demCart }}</span>
        </h4>
        <ul class="list-group mb-3" v-for="(cart, index) in carts" :key="index">
          <li
            class="list-group-item d-flex justify-content-between lh-condensed"
          >
            <div>
              <h6 class="my-0">{{ cart.tensanpham }}</h6>
              <small class="text-muted"
                >Số lượng: {{ cart.soluong }} x {{ cart.giasp }} &#x20AB;</small
              >
            </div>
            <img :src="cart.hinhanh" style="height: 55px; width: 55px" alt="" />
          </li>
        </ul>

        <form class="card p-2">
          <div class="float-right mr-3 mb-3">
            <tr>
              <td colspan="4" class="text-right pr-2">
                <strong>Tạm tính:</strong>
              </td>
              <td>{{ demTamTinh.toLocaleString() }} &#x20AB;</td>
            </tr>
            <tr>
              <td colspan="4" class="text-right pr-2">
                <strong>Phí vận chuyển:</strong>
              </td>
              <td>30,000 &#x20AB;</td>
            </tr>
            <tr>
              <td colspan="4" class="text-right pr-2">
                <strong>Tổng cộng:</strong>
              </td>
              <td>{{ demTongTien.toLocaleString() }} &#x20AB;</td>
            </tr>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
  layout: 'default',
  data() {
    return {
      tenkhachhang: '',
      dienthoai: '',
      diachi: '',
      phuongthucthanhtoan: '',
      carts: [],
    }
  },

  computed: {
    demSoLuong() {
      let demSoLuong = 0
      for (let i = 0; i < this.carts.length; i++) {
        demSoLuong += this.carts[i].soluong
      }
      return demSoLuong
    },
    demTamTinh() {
      let demTamTinh = 0
      for (let i = 0; i < this.carts.length; i++) {
        demTamTinh += this.carts[i].tongtien
      }
      return demTamTinh
    },
    demTongTien() {
      let demTongTien = 0
      let a = 0
      const ship = 30000
      for (let i = 0; i < this.carts.length; i++) {
        a += this.carts[i].tongtien
        demTongTien = a + ship
      }
      return demTongTien
    },
    demCart() {
      let demCart = 0
      for (let i = 0; i < this.carts.length; i++) {
        demCart += 1
      }
      return demCart
    },
  },

  async created() {
    await this.getCart()
  },
  mounted() {},
  methods: {
    async getCart() {
      try {
        const { data } = await catalogApi.getCart(this.$axios)
        this.carts = data
      } catch (err) {
        console.log(err)
      }
    },

    async DatHang() {
      if (this.demCart === 0) {
        alert('Mời bạn mua hàng trước khi đặt hàng')
      } else {
        try {
          for (let i = 0; i < this.carts.length; i++) {
            await this.$axios.post('/api/Catalog/add-orders', {
              tenkhachhang: this.tenkhachhang,
              dienthoai: this.dienthoai,
              diachi: this.diachi,
              tensanpham: this.carts[i].tensanpham,
              soluongmua: this.carts[i].soluong,
              trangthai: 'Chờ xác nhận',
              giasp: this.carts[i].giasp,
              hinhanh: this.carts[i].hinhanh,
              tongtien: this.demTongTien,
              phuongthucthanhtoan: this.phuongthucthanhtoan,
            })
            await this.$axios.delete(
              `/api/Catalog/delete-cart/` + this.carts[i].id_cart
            )
          }
          alert('Đặt hàng thành công.')
          this.$router.push(`/giohang`)
        } catch (err) {
          alert('Có lỗi xảy ra, vui lòng thử lại.' + JSON.stringify(err))
        }
      }
    },
  },
}
</script>
<style>
.img-cart {
  display: block;
  max-width: 50px;
  height: auto;
  margin-left: auto;
  margin-right: auto;
}
table tr td {
  border: 1px solid #ffffff;
}

table tr th {
  background: #eee;
}

.panel-shadow {
  box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}
</style>
