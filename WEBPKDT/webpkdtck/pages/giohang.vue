<template>
  <div class="container">
    <link
      rel="stylesheet"
      type="text/css"
      href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
    />
    <div class="container bootstrap snippets bootdey">
      <div class="col-md-12 col-sm-8 content">
        <div class="row">
          <div class="col-md-12">
            <ol class="breadcrumb">
              <li><a href="/">Trang chủ ></a></li>
              <li class="active">> Giỏ hàng</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-info panel-shadow">
              <div class="panel-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Thao tác</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(cart, index) in carts" :key="index">
                        <td>
                          <img
                            :src="cart.hinhanh"
                            style="height: 250px; width: 250px"
                            alt=""
                          />
                        </td>

                        <td>
                          <p>{{ cart.tensanpham }}</p>
                        </td>
                        <td>{{ cart.giasp }}</td>

                        <td>
                          <form class="form-inline">
                            <input
                              v-model="cart.soluong"
                              class="form-control"
                              type="text"
                              style="width: 65px"
                            />
                            <button rel="tooltip" class="btn btn-default">
                              <i class="fa fa-pencil"></i>
                            </button>
                          </form>
                        </td>
                        <td>{{ cart.tongtien }}</td>
                        <td>
                          <button
                            class="btn btn-danger"
                            @click="clickDelete(cart.id_cart)"
                          >
                            <i class="fa fa-trash-o"></i>
                          </button>
                        </td>
                        <hr />
                      </tr>
                    </tbody>
                  </table>
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
                </div>
              </div>
            </div>

            <div class="text-end">
              <a href="/sanpham" class="btn btn-success">Tiếp tục mua hàng</a>
              <a href="/thanhtoan" class="btn btn-info pull-right"
                >Thanh toán</a
              >
            </div>
          </div>
        </div>
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
      carts: [],
    }
  },

  computed: {
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
    clickDelete(id) {
      this.$axios.delete(`/api/Catalog/delete-cart/` + id).then(() => {
        this.getCart()
      })
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
