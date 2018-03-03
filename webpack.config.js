const path = require('path');

module.exports = {
  entry: {
    app:      "./src/index.js",
    rest_doc: "./src/rest_doc.js",
  },
  output: {
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, 'dist')
  },
  module: {
    rules: [
      {
        test: require.resolve('./src/index.js'),
      }
    ]
  },
  mode: 'development',
  devtool: 'inline-source-map',
};