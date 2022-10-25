<template>
  <div class="container">
    <form action="">
      <div>
        <h5 class="chao">Chào mừng bạn đến với cửa hàng</h5>
        <h5 class="dangnhap">
          Mọi thắc mắc xin vui lòng đăng nhập để được hỗ trợ
        </h5>
      </div>
      <div class="form-group">
        <label for="">Tên đăng nhập</label>
        <input v-model="dataForm.username" type="text" class="form-control" />
      </div>
      <div class="form-group">
        <label for="">Mật khẩu</label>
        <input
          v-model="dataForm.password"
          type="password"
          class="form-control"
        />
      </div>
      <!--    <div class="form-group">
        <label for="">Họ tên</label>
        <input v-model="dataForm.fullName" type="text" class="form-control" />
        <span> Hello {{ dataForm.fullName }} </span>
      </div>
      
      <div class="form-group">
        <label for="">Giới tính</label>
        <div class="form-check">
          <input
            id="exampleRadios1"
            v-model="dataForm.gender"
            class="form-check-input"
            type="radio"
            name="exampleRadios"
            value="1"
          />
          <label class="form-check-label" for="exampleRadios1"> Nam </label>
        </div>
        <div class="form-check">
          <input
            id="exampleRadios2"
            v-model="dataForm.gender"
            class="form-check-input"
            type="radio"
            name="exampleRadios"
            value="2"
          />
          <label class="form-check-label" for="exampleRadios2"> Nữ </label>
        </div>
      </div>
      <div class="form-group">
        <label for="">Quê quán</label>

        <select id="" v-model="dataForm.province" name="" class="form-control">
          <option value="-1">Chọn quê quán</option>
          <option
            v-for="(item, index) in listTinhThanh"
            :key="index"
            :value="item.id"
          >
            {{ item.name }}
          </option>
        </select>
      </div>
      <div class="form-check">
        <input
          v-model="dataForm.aggree"
          class="form-check-input"
          type="checkbox"
          value="1"
        />
        <label class="form-check-label" for="defaultCheck1">
          Đồng ý với điều khoản quy định của website
        </label>
        
      </div>
      -->
      <button type="submit" class="btn btn-primary">Đăng Nhập</button>
    </form>
  </div>
</template>
<script>
export default {
  layout: 'default',
  data() {
    return {
      listTinhThanh: [
        { id: 1, name: 'Đà Nẵng' },
        { id: 2, name: 'Hà Nội' },
        { id: 3, name: 'Hồ Chí Minh' },
        { id: 4, name: 'Thừa Thiên - Huế' },
      ],
      dataForm: {
        username: '',
        password: '',
        fullName: '',
        gender: 2,
        province: 3,
        aggree: false,
      },
    }
  },
}
</script>
<style >
.form-control {
  width: 50% !important;
}
.chao {
  font-size: 29px;
  color: darkgreen;
  text-align: center;
  margin-bottom: 50px;
}

.form-group {
}
</style>