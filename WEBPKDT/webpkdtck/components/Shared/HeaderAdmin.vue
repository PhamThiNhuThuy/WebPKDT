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

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
        <input
          type="search"
          class="form-control form-control-dark"
          placeholder="Search..."
          aria-label="Search"
        />
      </form>

      <button class="btn btn-primary" @click="signOut()">Đăng xuất</button>
    </div>
  </div>
</template>
<script>
import { mapGetters, mapActions } from 'vuex'

export default {
  name: 'Admin',
  computed: {
    ...mapGetters({
      isAdmin: 'user/isAdmin',
      isSaler: 'user.isSaler',
    }),
  },
  methods: {
    ...mapActions({
      logout: 'user/logout',
    }),
    async signOut() {
      await this.logout()

      this.$router.push('/')
    },
  },
}
</script>
