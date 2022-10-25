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
          <h2>Quản lý người dùng</h2>
        </div>
        <div>
          <ValidationObserver v-slot="{ handleSubmit }">
            <form action="" @submit.prevent="handleSubmit(onSubmit)">
              <div class="form-group">
                <label for="">Tên người dùng</label>
                <ValidationProvider
                  v-slot="{ errors }"
                  rules="required|max:255"
                  name="Tên khách hàng"
                >
                  <input
                    v-model="dataSubmit.tenkhachhang"
                    type="text"
                    class="form-control"
                  />
                  <p class="muted text-danger">
                    {{ errors[0] }}
                  </p>
                </ValidationProvider>
              </div>
              <div class="from-group">
                <label for="">Email</label>
                <input
                  v-model="dataSubmit.email"
                  type="text"
                  class="form-control"
                />
              </div>
              <div class="from-group">
                <label for="">Số điện thoại</label>
                <input
                  v-model="dataSubmit.dienthoai"
                  type="text"
                  class="form-control"
                />
              </div>

              <div class="from-group">
                <label for="">Địa chỉ</label>
                <input
                  v-model="dataSubmit.diachi"
                  type="text"
                  class="form-control"
                />
              </div>
              <div class="from-group">
                <label for="">Mật khẩu</label>
                <input
                  v-model="dataSubmit.matkhau"
                  type="password"
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
import catalogApi from '@/api/catalogApi'
export default {
  layout: 'defaultadmin',
  data() {
    return {
      dataSubmit: {
        tenkhachhang: '',
        diachi: '',
        dienthoai: '',
        email: '',
        matkhau: '',
      },
    }
  },
  async created() {
    await this.getUser()
  },
  methods: {
    async getUser() {
      try {
        const { data } = await catalogApi.getUser(this.$axios)
        this.user = data
      } catch (err) {
        console.log(err)
      }
    },
    async onSubmit() {
      try {
        await catalogApi.addUser(this.$axios, this.dataSubmit)
        alert('Thêm người dùng thành công')
        this.$router.push('/admin/tableUser')
      } catch (err) {
        alert('có lỗi xảy ra,vui lòng thử lại ' + JSON.stringify(err))
      }
    },
  },
}
</script>