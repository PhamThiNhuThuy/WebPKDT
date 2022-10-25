<template>
  <div class="container">
    <div class="row">
      <div
        class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
        style="width: 180px"
      >
        <a
          href="/"
          class="
            d-flex
            align-items-center
            mb-3 mb-md-0
            me-md-auto
            text-white text-decoration-none
          "
        >
          <svg class="bi me-2" width="40" height="32">
            <use xlink:href="#bootstrap" />
          </svg>
          <span class="fs-4">HOME</span>
        </a>
        <hr />
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/admin/">
              <span data-feather="home"></span>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/donhang">
              <span data-feather="file"></span>
              Đơn hàng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/sanpham">
              <span data-feather="shopping-cart"></span>
              Sản phẩm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/danhmuc">
              <span data-feather="users"></span>
              Danh mục
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/admin/tableUser">
              <span data-feather="users"></span>
              Người dùng
            </a>
          </li>
        </ul>
        <hr />
      </div>
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="col-md-12 breadcrumb" style="background-color: darkkhaki">
          <h2>Quản lý đơn hàng</h2>
        </div>

        <ul class="nav"></ul>
        <div class="table-responsive">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Thông tin khách hàng</th>
                <th scope="col">Thông tin đơn hàng</th>
                <th scope="col">Trạng Thái</th>
                <th scope="col">Thao Tác</th>
              </tr>
            </thead>

            <tbody v-for="(order, index) in ListOrder" :key="index">
              <th scope="row">{{ order.id_order }}</th>

              <td>
                <strong>Tên:</strong> {{ order.tenkhachhang }}
                <hr />
                <strong>Địa chỉ:</strong> {{ order.diachi }}
                <hr />
                <strong>Số điện thọại:</strong> {{ order.dienthoai }}
              </td>
              <td>
                <strong>Tên sản phẩm: </strong>{{ order.tensanpham }}
                <hr />
                <strong>Giá sản phẩm: </strong>{{ order.giasp }} &#x20AB;
                <hr />
                <strong>Số lượng: </strong>{{ order.soluongmua }}
                <hr />
                <strong>Tổng cộng: </strong
                >{{ order.tongtien.toLocaleString() }} &#x20AB;
              </td>

              <td>
                <a class="btn btn-danger" @click="Onclickk(order.id_order)">
                  {{ order.trangthai }}</a
                >
              </td>

              <td>
                <a class="btn btn-danger" @click="OnDelete(order.id_order)"
                  >Xóa</a
                >
              </td>
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
  layout: 'defaultadmin',

  data() {
    return {
      ListOrder: [],
    }
  },

  async created() {
    await this.getAllOrders()
    await this.OnDelete()
  },
  mounted() {},

  methods: {
    async getAllOrders() {
      try {
        const { data } = await catalogApi.getOrders(this.$axios)
        console.log(data)
        this.ListOrder = data
      } catch (err) {
        console.log(err)
      }
    },
    async OnDelete(id) {
      try {
        await catalogApi.deleteOrders(this.$axios, id)
        alert('Deleted')
        this.$router.go()
      } catch (error) {}
    },
  },
}
</script>
