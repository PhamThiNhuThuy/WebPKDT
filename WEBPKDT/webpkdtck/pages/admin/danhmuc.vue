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
        <div class="col-md-12 breadcrumb" style="background-color: bisque">
          <h2>Quản lý danh mục</h2>
        </div>

        <ul class="nav">
          <li>
            <nuxt-link to="/admin/dmuc/add" class="btn btn-success ml-4 mb-3"
              >Thêm danh mục</nuxt-link
            >
          </li>
        </ul>
        <div class="table-responsive">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="row" style="text-align: center">ID</th>
                <th style="text-align: center">Tên danh mục</th>
                <th style="text-align: center">Chức năng</th>
              </tr>
            </thead>
            <tbody
              v-for="(danhmuc, index) in listDanhMuc"
              :key="index"
              class="col-12 col-md-3 mb-3 text-center"
            >
              <danhmucsanpham :danhmuc="danhmuc" />
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>
<script>
import danhmucsanpham from '@/components/Index/danhmucsanpham.vue'
import catalogApi from '@/api/catalogApi'
export default {
  components: { danhmucsanpham },
  layout: 'defaultadmin',
  data() {
    return {
      listDanhMuc: [],
    }
  },
  async created() {
    await this.getAllDanhMuc()
  },
  mounted() {},
  methods: {
    async getAllDanhMuc() {
      try {
        const { data } = await catalogApi.getDanhMuc(this.$axios)
        console.log(data)
        this.listDanhMuc = data
      } catch (err) {
        console.log(err)
      }
    },
  },
}
</script>
