const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    './js/**/*.js'
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.warmGray,
      green: colors.lime,
      indigo: colors.indigo,
      red: colors.red,
      yellow: colors.amber,
    },
    extend: {}
  },
  variants: {
    display: ['responsive', 'empty']
  },
  plugins: [
    require('tailwindcss-empty-pseudo-class')()
  ]
}