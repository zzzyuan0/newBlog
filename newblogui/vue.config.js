const path = require('path')

module.exports = {
  // 关闭语法检查
  lintOnSave: false,
  pluginOptions: {
    'style-resources-loader': {
      preProcessor: 'less',
      patterns: path.resolve(__dirname, 'src/conf/globalCss.less')
    }
  },

}
