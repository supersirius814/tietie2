const path = require('path');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;
const ChunkRenamePlugin = require('webpack-chunk-rename-plugin');

function resolve(dir) {
  return path.join(
    __dirname,
    '/resources/vue',
    dir
  );
}

const rawArgv = process.argv.slice(2);
const report = rawArgv.includes('--report');
const plugins = [new ChunkRenamePlugin({ initialChunksWithEntry: true, '/assets/js/app': 'assets/js/app.js', '/assets/js/vendor': 'assets/js/vendor.js' })];
if (report) {
  plugins.push(new BundleAnalyzerPlugin({
    openAnalyzer: true,
  }));
}
module.exports = {
  resolve: {
    extensions: ['.js', '.vue', '.json'],
    alias: {
      vue$: 'vue/dist/vue.esm.js',
      '@': path.join(__dirname, '/resources/vue'),
    },
  },
  module: {
    rules: [
      {
        test: /\.svg$/,
        loader: 'svg-sprite-loader',
        include: [resolve('icons')],
        options: {
          symbolId: 'icon-[name]',
        },
      },
    ],
  },
  plugins: plugins,
  output: {
    filename: '[name].js',
    chunkFilename: 'assets/js/[name].[chunkhash:6].js',
  },
};
