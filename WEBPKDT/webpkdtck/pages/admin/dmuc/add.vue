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

        <div>
          <ValidationObserver v-slot="{ handleSubmit }">
            <h4>Thêm danh mục</h4>

            <form action="" @submit.prevent="handleSubmit(onSubmit)">
              <div class="form-group">
                <label for="">Tên danh mục</label>
                <ValidationProvider
                  v-slot="{ errors }"
                  rules="required|max:255"
                  name="Tên danh mục"
                >
                  <input
                    v-model="dataSubmit.tendanhmuc"
                    placeholder="Nhập tên danh mục"
                    type="text"
                    class="form-control"
                  />

                  <p class="muted text-danger">
                    {{ errors[0] }}
                  </p>
                </ValidationProvider>
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
import catalogApi from '@/api/catalogApi'
export default {
  layout: 'defaultadmin',
  data() {
    return {
      dataSubmit: {
        tendanhmuc: '',
      },
      danhmuc: [],
    }
  },

  methods: {
    async onSubmit() {
      try {
        await catalogApi.addDanhMuc(this.$axios, this.dataSubmit)
        alert('Thêm danh mục thành công')
        this.$router.push('/admin/danhmuc')
      } catch (err) {
        alert('Có lỗi xảy ra, vui lòng thử lại.' + JSON.stringify(err))
      }
    },
  },
}
</script>