export default {
  getSanPham(axios) {
    return axios.get('/api/Catalog/sanpham')
  },
  addSanPham(axios, data) {
    const url = '/api/Catalog/add-sanpham'
    return axios.$post(url, data)
  },
  deleteSanPham(axios, id_sanpham) {
    return axios.$delete(`/api/Catalog/delete-sanpham/${id_sanpham}`)
  },
  getProductviaCateId(axios, cateId) {
    return axios.get(`/api/Catalog/Id_DanhMuc?CategoryId=${cateId}`)
  },

  getUser(axios) {
    return axios.get('/api/Catalog/users')
  },
  addUser(axios, data) {
    const url = '/api/Catalog/add-user'

    return axios.$post(url, data)
  },
  deleteUser(axios, id_users) {
    return axios.$delete(`/api/Catalog/delete-user/${id_users}`)
  },
  addUsersRegister(axios, data) {
    const url = '/api/Catalog/add-user-register'
    return axios.$post(url, data)
  },

  getCart(axios) {
    return axios.get('/api/Catalog/cart')
  },
  getCart_Details(axios) {
    return axios.get('/api/Catalog/cart_details')
  },
  getOrders(axios) {
    return axios.get('/api/Catalog/orders')
  },
  addOrders(axios, data) {
    const url = '/api/Catalog/add-orders'
    return axios.$post(url, data)
  },
  deleteOrders(axios, id_order) {
    return axios.$delete(`/api/Catalog/delete-orders/${id_order}`)
  },

  getAdmin(axios) {
    return axios.get('/api/Catalog/admin')
  },

  getTrangChu(axios) {
    return axios.get('/api/Catalog/trangchu')
  },

  getDanhMuc(axios) {
    return axios.get('/api/Catalog/danhmuc')
  },
  addDanhMuc(axios, data) {
    const url = '/api/Catalog/add-danhmuc'
    return axios.$post(url, data)
  },
  editDanhMuc(axios, id, data) {
    const url = `/api/Catalog/update-danhmuc/${id}`
    return axios.$put(url, data)
  },
}
