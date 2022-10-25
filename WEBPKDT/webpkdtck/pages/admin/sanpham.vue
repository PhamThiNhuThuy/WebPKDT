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
        <div class="col-md-12 breadcrumb" style="background-color: cadetblue">
          <h2>Quản lý sản phẩm</h2>
        </div>

        <ul class="nav">
          <li>
            <nuxt-link to="/admin/spham/add" class="btn btn-success ml-4 mb-3"
              >Thêm sản phẩm</nuxt-link
            >
          </li>
        </ul>
        <div class="table-responsive">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Tên Sản Phẩm</th>
                <th scope="col">Mã Sản Phẩm</th>
                <th scope="col">Giá Sản Phẩm</th>
                <th scope="col">Số Lượng</th>
                <th scope="col">Hình Ảnh</th>
                <th scope="col">Tóm Tắt</th>
                <th scope="col">Tình Trạng</th>
                <th scope="col">ID Danh Mục</th>
                <th scope="col">Thao Tác</th>
              </tr>
            </thead>

            <tbody v-for="(sanpham, index) in listSanPham" :key="index">
              <th scope="row">{{ sanpham.id_sanpham }}</th>
              <td>{{ sanpham.tensanpham }}</td>
              <td>{{ sanpham.masp }}</td>
              <td>{{ sanpham.giasp }}</td>
              <td>{{ sanpham.soluong }}</td>
              <td>
                <img
                  :src="sanpham.hinhanh"
                  class="img-fluid"
                  alt=""
                  width="70px"
                  height="70px"
                />
              </td>
              <td>{{ sanpham.tomtat }}</td>
              <td>{{ sanpham.tinhtrang }}</td>
              <td>{{ sanpham.id_danhmuc }}</td>
              <td>
                <a class="btn btn-info" :href="geturl(sanpham.id_sanpham)"
                  >Sửa</a
                >
                <a
                  class="btn btn-danger"
                  @click="DeleteSanPham(sanpham.id_sanpham)"
                  >Xóa</a
                >
              </td>
              <!-- <danhmucsanpham :sanpham="sanpham" /> -->
            </tbody>
          </table>
        </div>
      </main>
    </div>
  </div>
</template>
<script>
// import danhmucsanpham from '@/components/Index/danhmucsanpham.vue'
import catalogApi from '@/api/catalogApi'
export default {
  // components: { danhmucsanpham },
  layout: 'defaultadmin',

  data() {
    return {
      listSanPham: [],
    }
  },
  async created() {
    await this.getAllSanPham()
  },
  mounted() {},
  methods: {
    async getAllSanPham() {
      try {
        const { data } = await catalogApi.getSanPham(this.$axios)
        console.log(data)
        this.listSanPham = data
      } catch (err) {
        console.log(err)
      }
    },
    DeleteSanPham(id) {
      this.$axios.delete(`/api/Catalog/delete-sanpham/` + id).then(() => {
        this.getSanPham()
      })
    },
    geturl(SanPhamID) {
      const url = '/admin/EditSanpham/' + SanPhamID
      return url
    },
  },
}
</script>
