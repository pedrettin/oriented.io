const path = require('path')

module.exports = {
    mode: 'development',
    entry: './src/index.js',
    module: {
        rules: [
            {
				test: /\.elm$/,
				include: path.resolve(__dirname, 'src'),
				loader: 'elm-webpack-loader?verbose=true',
            },
            {
                test:    /\.html$/,
                include: path.resolve(__dirname, 'src'),
                loader:  'file-loader?name=[name].[ext]',
            }
        ]
    },
    output: {
        path: path.resolve(__dirname + '/dist'),
        publicPath: "build/",
        filename: '[name].js'
    },
	devServer: {
		https: true
    }
}