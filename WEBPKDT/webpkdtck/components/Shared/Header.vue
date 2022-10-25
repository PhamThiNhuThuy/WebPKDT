<template>
  <div>
    <div
      class="
        d-flex
        flex-column flex-md-row
        align-items-center
        p-3
        px-md-4
        mb-3
        bg-dark
        border-bottom
        shadow-sm
      "
    >
      <h5 class="my-0 mr-md-auto font-weight-normal">
        <img style="height: 44px" src="@/img/logo.PNG" alt="" />
      </h5>

      <ul
        class="
          nav
          col-12 col-lg-auto
          me-lg-auto
          mb-2
          justify-content-center
          mb-md-0
        "
      >
        <li>
          <a href="/" class="nav-link px-2 text-secondary">Trang chủ</a>
        </li>
        <li>
          <a href="/gioithieu" class="nav-link px-2 text-secondary"
            >Giới thiệu</a
          >
        </li>
        <li>
          <a href="/sanpham" class="nav-link px-2 text-secondary">Sản phẩm</a>
        </li>
        <li>
          <a href="/hoidap" class="nav-link px-2 text-secondary">Hỏi đáp</a>
        </li>
      </ul>
      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
        <input
          type="search"
          class="form-control form-control-dark"
          placeholder="Search..."
          aria-label="Search"
        />
      </form>
      <div class="text-end">
        <a class="btn btn-primary" href="/login">Đăng nhập</a>
        <a class="btn btn-warning" href="/register">Đăng ký</a>
        <a class="btn btn-danger" href="/giohang"
          ><svg
            xmlns="http://www.w3.org/2000/svg"
            width="16"
            height="16"
            fill="currentColor"
            class="bi bi-cart3"
            viewBox="0 0 16 16"
          >
            <path
              d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
            /></svg
        ></a>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Default',
}
</script>
