const path = require('path');
const json5 = require('json5');

module.exports = {
    mode: 'development',
    entry: {
        index: './src/index.js',
        tabs: './src/tabs.js',
    },
    devtool: 'inline-source-map',
    output: {
        filename: '[name].bundle.js',
        path: path.resolve(__dirname, 'dist'),
    },
    module: {
        rules: [
            {
                test: /\.json5$/i,
                type: 'json',
                parser: {
                    parse: json5.parse,
                },
            },
        ]
    }
};