module.exports = {
  port: process.env.PORT | 3000,
  session: {
    secret: 'myblog',
    key: 'myblog',
    maxAge: 2592000000
  },
  mongodb: 'mongodb://mongo:27017/myblog'
}
