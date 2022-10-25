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
                <h3>Đăng ký</h3>
              </div>
              <ValidationObserver v-slot="{ handleSubmit }">
                <form action="" @submit.prevent="handleSubmit(onSubmit)">
                  <div class="form-group first">
                    <label for="username">Tên đăng nhập</label>
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:255"
                      name="Username"
                    >
                      <input
                        id="username"
                        v-model="dataSubmit.tenkhachhang"
                        type="text"
                        placeholder="Nhập tên đăng nhập"
                        class="form-control"
                      />
                      <p class="muted text-danger">
                        {{ errors[0] }}
                      </p>
                    </ValidationProvider>
                  </div>
                  <div class="form-group first">
                    <label for="email">Email</label>
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:255"
                      name="Email"
                    >
                      <input
                        id="email"
                        v-model="dataSubmit.email"
                        type="text"
                        placeholder="mail@example.com"
                        class="form-control"
                      />
                      <p class="muted text-danger">
                        {{ errors[0] }}
                      </p>
                    </ValidationProvider>
                  </div>
                  <div class="form-group first">
                    <label for="address">Địa chỉ</label>
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:255"
                      name="Address"
                    >
                      <input
                        id="address"
                        v-model="dataSubmit.diachi"
                        placeholder="Nhập địa chỉ"
                        type="text"
                        class="form-control"
                      />
                      <p class="muted text-danger">
                        {{ errors[0] }}
                      </p>
                    </ValidationProvider>
                  </div>
                  <div class="form-group first">
                    <label for="sdt">Số điện thoại</label>
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:255"
                      name="Phone"
                    >
                      <input
                        id="sdt"
                        v-model="dataSubmit.dienthoai"
                        placeholder="Nhập số điện thoại"
                        type="text"
                        class="form-control"
                      />
                      <p class="muted text-danger">
                        {{ errors[0] }}
                      </p>
                    </ValidationProvider>
                  </div>

                  <div class="form-group last mb-4">
                    <label for="password">Mật khẩu</label>
                    <ValidationProvider
                      v-slot="{ errors }"
                      rules="required|max:255"
                      name="Password"
                    >
                      <input
                        id="password"
                        v-model="dataSubmit.matkhau"
                        placeholder="Nhập mật khẩu"
                        type="password"
                        class="form-control"
                      />
                      <p class="muted text-danger">
                        {{ errors[0] }}
                      </p>
                    </ValidationProvider>
                  </div>
                  <button type="submit" class="btn btn-block btn-warning">
                    Đăng ký
                  </button>
                </form>
              </ValidationObserver>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import catalogApi from '@/api/catalogApi'

export default {
  layout: 'default',
  data() {
    return {
      dataSubmit: {
        tenkhachhang: '',
        email: '',
        diachi: '',
        dienthoai: '',
        matkhau: '',
      },
    }
  },

  methods: {
    async onSubmit() {
      try {
        await catalogApi.addUsersRegister(this.$axios, this.dataSubmit)
        alert('Đăng ký thành công')
        this.$router.push('/sanpham')
      } catch (err) {
        alert('Có lỗi xảy ra, vui lòng thử lại.' + JSON.stringify(err))
      }
    },
  },
}
</script>
