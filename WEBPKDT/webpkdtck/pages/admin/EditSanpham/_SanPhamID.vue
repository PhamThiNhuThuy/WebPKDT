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
          <h2>Quản lý sản phẩm</h2>
        </div>

        <form action=" " @submit.prevent="UpdateSanpham(sanpham)">
          <div class="form-group">
            <h4>Sửa sản phẩm</h4>
            <label for="">Tên sản phẩm</label>
            <input
              v-model="sanpham.tensanpham"
              type="text"
              class="form-control"
            />
            <input :value="sanpham.masp" type="text" class="form-control" />
            <input :value="sanpham.giasp" type="text" class="form-control" />
            <input :value="sanpham.soluong" type="text" class="form-control" />

            <input :value="sanpham.tomtat" type="text" class="form-control" />
            <input :value="sanpham.hinhanh" type="text" class="form-control" />
            <input
              :value="sanpham.tinhtrang"
              type="text"
              class="form-control"
            />
          </div>
          <input :value="sanpham.id_danhmuc" type="text" class="form-control" />
          <button type="submit" class="btn btn-primary">Lưu</button>
          <button type="reset" class="btn btn-outline-primary">Nhập lại</button>
        </form>
      </main>
    </div>
  </div>
</template>
<script>
export default {
  layout: 'defaultadmin',

  data() {
    return {}
  },
  methods: {
    async UpdateSanpham(sanpham) {
      try {
        await this.$axios.put(
          '/api/Catalog/update-sanpham/' + sanpham.id_sanpham,
          {
            id_sanpham: sanpham.id_sanpham,
            tensanpham: sanpham.tensanpham,
            masp: sanpham.masp,
            giasp: sanpham.giasp,
            soluong: sanpham.soluong,
            hinhanh: sanpham.hinhanh,
            tomtat: sanpham.tomtat,
            tinhtrang: sanpham.tinhtrang,
            id_danhmuc: sanpham.id_danhmuc,
          }
        )
        alert('Sửa sản phẩm thành công')
        this.$router.push('/admin/sanpham')
      } catch (err) {
        console.log(err)
      }
    },
  },
  async asyncData({ $axios, params }) {
    const sanpham = await $axios.$get(
      `/api/Catalog/sanpham-by-danhmuc/${params.SanPhamID}`
    )
    console.log(sanpham)
    return { sanpham }
  },
}
</script>