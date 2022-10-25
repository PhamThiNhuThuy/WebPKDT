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
        <div>
          <ValidationObserver v-slot="{ handleSubmit }">
            <form action="" @submit.prevent="handleSubmit(onSubmit)">
              <div class="form-group">
                <label for="">Tên Sản Phẩm</label>
                <ValidationProvider
                  v-slot="{ errors }"
                  rules="required|max:255"
                  name="Tên sản phẩm"
                >
                  <input
                    v-model="dataSubmit.tensanpham"
                    name=""
                    class="form-control"
                  />
                  <p class="muted text-danger">
                    {{ errors[0] }}
                  </p>
                </ValidationProvider>
              </div>
              <div class="form-group">
                <label for="">Mã Sản Phẩm</label>
                <input
                  v-model="dataSubmit.masp"
                  type="text"
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="">Số Lượng</label>
                <input
                  v-model="dataSubmit.soluong"
                  type="text"
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="">Hình Ảnh</label>
                <input
                  v-model="dataSubmit.hinhanh"
                  type=""
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="">Tóm Tắt</label>
                <textarea
                  v-model="dataSubmit.tomtat"
                  type="text"
                  class="form-control"
                ></textarea>
              </div>
              <div class="form-group">
                <label for="">Tình Trạng</label>
                <input
                  v-model="dataSubmit.tinhtrang"
                  type="text"
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="">ID Danh Mục</label>
                <input
                  v-model="dataSubmit.id_danhmuc"
                  type="text"
                  class="form-control"
                />
              </div>
              <button type="submit" class="btn btn-primary">Lưu</button>
              <button type="reset" class="btn btn-outline-primary">
                Nhập lại
              </button>
            </form>
          </ValidationObserver>
        </div>
      </main>
    </div>
  </div>
</template>
<script>
import catalogApi from '@/api/catalogApi.js'
export default {
  layout: 'defaultadmin',

  data() {
    return {
      dataSubmit: {
        tensanpham: 'string',
        masp: 'string',
        giasp: '10000',
        soluong: 0,
        hinhanh: 'string',
        tomtat: 'string',
        tinhtrang: 10,
        id_danhmuc: 0,
      },
      SanPham: [],
    }
  },
  async created() {
    await this.getSanPham()
  },
  methods: {
    async getSanPham() {
      try {
        const { data } = await catalogApi.getSanPham(this.$axios)
        this.SanPham = data
      } catch (err) {}
    },
    async onSubmit() {
      try {
        await catalogApi.addSanPham(this.$axios, this.dataSubmit)
        alert('Thêm Thành Công')
        this.$router.push('/admin')
      } catch (err) {
        alert('Có lỗi xảy ra, vui lòng thử lại' + JSON.stringify(err))
      }
    },
  },
}
</script>