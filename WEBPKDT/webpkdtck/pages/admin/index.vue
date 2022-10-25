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
        <div class="col-md-12 breadcrumb">
          <h2 style="padding-right: 560px">Dashboard</h2>
        </div>

        <div class="row">
          <div class="col-xl-3 col-md-6 mb-4" style="background: coral">
            <h6>Đơn hàng</h6>
            <span>{{ demDonHang }}</span>
            <p class="m-b-0">
              <a href="/admin/donhang">Chi tiết</a><span class="f-right"></span>
            </p>
          </div>
          <div class="col-xl-3 col-md-6 mb-4" style="background: greenyellow">
            <h6>Sản phẩm</h6>
            <span>{{ demSanPham }}</span>
            <p class="m-b-0">
              <a href="/admin/sanpham">Chi tiết</a><span class="f-right"></span>
            </p>
          </div>
          <div class="col-xl-3 col-md-6 mb-4" style="background: skyblue">
            <h6>Danh mục</h6>
            <span>{{ demDanhMuc }}</span>
            <p class="m-b-0">
              <a href="/admin/danhmuc">Chi tiết</a><span class="f-right"></span>
            </p>
          </div>
          <div class="col-xl-3 col-md-6 mb-4" style="background: plum">
            <h6>Người dùng</h6>
            <span class="text-gray-500">{{ demUser }}</span>
            <p class="m-b-0">
              <a href="/admin/tableUser">Chi tiết</a
              ><span class="f-right"></span>
            </p>
          </div>
          <div class="col-xl-3 col-md-6 mb-4" style="background: #ffc107">
            <h6>Doanh thu</h6>
            <span class="text-gray-500">{{
              demDoanhThu.toLocaleString()
            }}</span>
            <p class="m-b-0">
              <a href="/admin/donhang">Chi tiết</a><span class="f-right"></span>
            </p>
          </div>
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
      listDonHang: [],
      listSanPham: [],
      listDanhMuc: [],
      listUser: [],
      listDoanhThu: [],
    }
  },

  computed: {
    demDonHang() {
      let demDonHang = 0
      for (let i = 0; i < this.listDonHang.length; i++) {
        demDonHang += 1
      }
      return demDonHang
    },
    demSanPham() {
      let demSanPham = 0
      for (let i = 0; i < this.listSanPham.length; i++) {
        demSanPham += 1
      }
      return demSanPham
    },
    demDanhMuc() {
      let demDanhMuc = 0
      for (let i = 0; i < this.listDanhMuc.length; i++) {
        demDanhMuc += 1
      }
      return demDanhMuc
    },
    demUser() {
      let demUser = 0
      for (let i = 0; i < this.listUser.length; i++) {
        demUser += 1
      }
      return demUser
    },
    demDoanhThu() {
      let demDoanhThu = 0
      for (let i = 0; i < this.listDoanhThu.length; i++) {
        demDoanhThu += this.listDoanhThu[i].tongtien
      }
      return demDoanhThu
    },
  },

  async created() {
    await this.getDonHang()
    await this.getSanPham()
    await this.getDanhMuc()
    await this.getUser()
    await this.getOrders()
  },
  mounted() {},
  methods: {
    async getDonHang() {
      try {
        const { data } = await catalogApi.getOrders(this.$axios)
        console.log(data)
        this.listDonHang = data
      } catch (err) {
        console.log(err)
      }
    },

    async getSanPham() {
      try {
        const { data } = await catalogApi.getSanPham(this.$axios)
        console.log(data)

        this.listSanPham = data
      } catch (err) {
        console.log(err)
      }
    },

    async getDanhMuc() {
      try {
        const { data } = await catalogApi.getDanhMuc(this.$axios)
        console.log(data)

        this.listDanhMuc = data
      } catch (err) {
        console.log(err)
      }
    },

    async getUser() {
      try {
        const { data } = await catalogApi.getUser(this.$axios)
        console.log(data)

        this.listUser = data
      } catch (err) {
        console.log(err)
      }
    },

    async getOrders() {
      try {
        const { data } = await catalogApi.getOrders(this.$axios)
        console.log(data)

        this.listDoanhThu = data
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>