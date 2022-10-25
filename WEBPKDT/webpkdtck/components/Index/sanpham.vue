<template>
  <div class="container">
    <div class="item">
      <div class="item-img">
        <img :src="sanpham.hinhanh" class="lazyload" width="210" height="210" />
      </div>

      <h5 style="max-height: 340px">
        {{ sanpham.tensanpham }}
      </h5>

      <p class="item-txt-online">{{ sanpham.giasp }}&#x20AB;</p>

      <div class="btn-group">
        <a
          :href="geturl(sanpham.id_sanpham)"
          v-if="sanpham.tinhtrang > 0"
          class="btn btn-info add-to-cart col-12 btn-block"
          style="width: 204px"
        >
          Xem ngay
        </a>
        <a
          v-else
          :href="geturl(sanpham.id_sanpham)"
          class="btn btn-outline-secondary add-to-cart col-12 btn-block"
          style="width: 204px"
        >
          Hết hàng
        </a>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    sanpham: {
      type: Object,
      requred: true,
      default() {
        return {}
      },
    },
  },
  methods: {
    geturl(thongtinsp) {
      const url = '/thongtin/' + thongtinsp
      return url
    },
  },
}
</script>
