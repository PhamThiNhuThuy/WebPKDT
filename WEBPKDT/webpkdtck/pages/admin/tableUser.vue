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
        <div class="col-md-12 breadcrumb" style="background-color: goldenrod">
          <h2>Quản lý người dùng</h2>
        </div>

        <ul class="nav">
          <li>
            <nuxt-link
              :to="'/admin/users/addUser'"
              class="btn btn-success ml-4 mb-3"
              >Thêm người dùng</nuxt-link
            >
          </li>
        </ul>

        <table class="table">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Họ tên</th>
              <th scope="col">Địa chỉ</th>
              <th scope="col">Số điện thoại</th>
              <th scope="col">Email</th>
              <th scope="col">Chức năng</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(user, index) in users" :key="index">
              <th scope="row">{{ user.id_users }}</th>
              <td>{{ user.tenkhachhang }}</td>
              <td>{{ user.diachi }}</td>
              <td>{{ user.dienthoai }}</td>
              <td>{{ user.email }}</td>
              <td>
                <button
                  class="btn btn-outline-info"
                  @click="clickUpdate(user.id_users)"
                >
                  <nuxt-link :to="'/admin/users/edit'">Sửa</nuxt-link>
                </button>
                <button
                  class="btn btn-danger"
                  @click="clickDelete(user.id_users)"
                >
                  Xóa
                </button>
              </td>
            </tr>
          </tbody>
        </table>
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
      users: [],
    }
  },
  async created() {
    await this.getUsers()
  },
  mounted() {},
  methods: {
    async getUsers() {
      try {
        const { data } = await catalogApi.getUser(this.$axios)
        this.users = data
      } catch (err) {
        console.log(err)
      }
    },
    clickDelete(id) {
      this.$axios.delete(`/api/Catalog/delete-user/` + id).then(() => {
        this.getUsers()
      })
    },
    clickUpdate(id) {},
  },
}
</script>
