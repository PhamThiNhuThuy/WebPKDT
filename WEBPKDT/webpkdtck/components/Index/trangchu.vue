
<template>
  <div class="container">
    <div class="item">
      <div class="item-img">
        <img
          :src="trangchu.hinhanh"
          class="lazyload"
          width="210"
          height="210"
        />
      </div>

      <h3>{{ trangchu.tensanpham }}</h3>

      <p class="item-txt-online">Online gia&#x301; re&#x309;</p>

      <strong class="price"> {{ trangchu.giasp }}&#x20AB;</strong>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    trangchu: {
      type: Object,
      requred: true,
      default() {
        return {}
      },
    },
  },

  methods: {},
}
</script>
