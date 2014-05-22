module.exports = pages = []
pages.push
  path: '/'
  RactExt: require './pages/index'

pages.push
  path: '/other'
  RactExt: require './pages/other'

pages.push
  path: '*'
  RactExt: require './pages/notfound'
