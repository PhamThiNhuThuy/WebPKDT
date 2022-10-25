
<template>
  <tr>
    <th scope="row">{{ danhmuc.id_danhmuc }}</th>
    <td>{{ danhmuc.tendanhmuc }}</td>
    <td>
      <a class="btn btn-info" :href="geturl(danhmuc.id_danhmuc)">Sửa</a>
      <a class="btn btn-danger" v-on:click="DeleteDanhMuc(danhmuc.id_danhmuc)"
        >Xóa</a
      >
    </td>
  </tr>
</template>
<script>
import catalogApi from '@/api/catalogApi'
export default {
  props: {
    danhmuc: {
      type: Object,
      requred: true,
      default() {
        return {}
      },
    },
  },
  data() {
    return {
      listDanhMuc: [],
    }
  },
  async created() {
    await this.getDanhMuc()
  },
  mounted() {},
  methods: {
    async getDanhMuc() {
      try {
        const { data } = await catalogApi.getDanhMuc(this.$axios)
        console.log(data)
        this.listDanhMuc = data
      } catch (err) {
        console.log(err)
      }
    },
    DeleteDanhMuc(id) {
      this.$axios.delete(`/api/Catalog/delete-danhmuc/` + id).then(() => {
        this.getDanhMuc()
      })
    },
    geturl(DanhmucID) {
      const url = '/admin/EditDanhmuc/' + DanhmucID
      return url
    },
  },
}
</script>

