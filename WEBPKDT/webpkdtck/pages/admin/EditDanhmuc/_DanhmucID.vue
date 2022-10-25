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

        <form action="">
          <div class="form-group">
            <h4>Sửa danh mục</h4>
            <label for="">Tên danh mục </label>
            <div :key="index" v-for="(products, index) in listProduct">
              <input
                :value="(dataForm.id_danhmuc = products.id_danhmuc)"
                type="hidden"
                class="form-control"
              />
              <input
                v-model="dataForm.id_danhmuc"
                type="hidden"
                class="form-control"
              />

              <input
                :value="(dataForm.tendanhmuc = products.tendanhmuc)"
                @change="products.tendanhmuc = $event.target.value"
                type="text"
                class="form-control"
              />
              <input
                v-model="dataForm.tendanhmuc"
                type="hidden"
                class="form-control"
              />
            </div>
          </div>

          <button @click.prevent="onSubmit" class="btn btn-primary">Lưu</button>
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
    return {
      listProduct: [],
      dataForm: {
        id_danhmuc: null,
        tendanhmuc: '',
      },
    }
  },

  async created() {
    await this.getProduct()
  },

  methods: {
    async onSubmit() {
      try {
        await this.$axios.$put(
          `/api/Catalog/update-danhmuc/${this.$route.params.DanhmucID}`,
          this.dataForm
        )
        alert('Sửa danh mục thành công')
        this.$router.push('/admin/danhmuc')
      } catch (err) {
        console.log(err)
      }
    },

    async getProduct() {
      const danhmuc = await this.$axios.$get(
        `/api/Catalog/danhmuc-by-danhmuc/${this.$route.params.DanhmucID}`
      )

      this.listProduct = danhmuc
      console.log(this.listProduct)
      return this.listProduct
    },
  },

  // async asyncData({ $axios, params }) {
  //   const danhmuc = await $axios.$get(
  //     `/api/Catalog/danhmuc-by-danhmuc/${params.DanhmucID}`
  //   )
  //   console.log(danhmuc)

  //   return { danhmuc }
  // },
}
</script>