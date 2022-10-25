<template>
  <div class="content">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <img
            src="https://preview.colorlib.com/theme/bootstrap/login-form-07/images/undraw_remotely_2j6y.svg"
            alt="Image"
            class="img-fluid"
          />
        </div>
        <div class="col-md-6 contents">
          <div class="row justify-content-center">
            <div class="col-md-8">
              <div class="mb-4">
                <h3>Đăng nhập</h3>
              </div>
              <form action="" @submit.prevent="onSubmit">
                <div class="form-group first">
                  <label for="username">Tên đăng nhập</label>
                  <input
                    id="username"
                    v-model="dataSubmit.tenkhachhang"
                    type="text"
                    class="form-control"
                    placeholder="Nhập tên đăng nhập"
                  />
                </div>
                <div class="form-group last mb-4">
                  <label for="password">Mật khẩu</label>
                  <input
                    id="password"
                    v-model="dataSubmit.matkhau"
                    type="password"
                    class="form-control"
                    placeholder="Nhập mật khẩu"
                  />
                </div>
                <div class="d-flex mb-5 align-items-center">
                  <label class="control control--checkbox mb-0"
                    ><span class="caption">Remember me</span>
                    <input type="checkbox" checked />
                    <div class="control__indicator"></div>
                  </label>
                  <span class="ml-auto">
                    <a href="#" class="forgot-pass">Quên mật khẩu</a>
                  </span>
                </div>
                <button type="submit" class="btn btn-block btn-primary">
                  Đăng nhập
                </button>

                <div class="social-login">
                  <a href="#" class="facebook">
                    <span class="bi bi-facebook"></span>
                  </a>
                  <a href="#" class="twitter">
                    <span class="icon-twitter mr-3"></span>
                  </a>
                  <a href="#" class="google">
                    <span class="icon-google mr-3"></span>
                  </a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import { mapActions } from 'vuex'
import accountApi from '@/api/accountApi'
export default {
  data() {
    return {
      dataSubmit: {
        tenkhachhang: '',
        matkhau: '',
      },
    }
  },
  methods: {
    ...mapActions({
      setToken: 'user/setToken',
      setRole: 'user/setRole',
    }),

    async onSubmit() {
      try {
        const data = await accountApi.login(this.$axios, this.dataSubmit)
        console.log(data.access_token)
        await this.setToken(data.access_token)
        await this.setRole(data.role)
        this.$router.push('/admin')
      } catch (err) {
        console.log(err)
        alert('Sai tên đăng nhập hoặc mật khẩu')
      }
    },
  },
}
</script>