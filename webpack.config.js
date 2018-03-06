const path = require('path');

module.exports = {
  entry: {
    app:         "./src/index.js",
    rest_doc:    "./src/rest_doc.js",
    source_code: "./src/source_code.js",
  },
  output: {
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, 'dist')
  },
  module: {
    rules: [
      {
        test: require.resolve('./src/index.js'),
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ],
      }
    ]
  },
  mode: 'development',
  devtool: 'inline-source-map',
};