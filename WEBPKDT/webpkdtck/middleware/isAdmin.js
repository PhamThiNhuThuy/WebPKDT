export default function ({ store, redirect }, next) {
  const authenticated = store.getters['user/isAdmin']

  if (!authenticated) {
    // chuyen ve trang login

    redirect('/login')
  }
  next()
}
