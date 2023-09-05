// const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {

  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/theming/themes")["[data-theme=light]"],
          "base-100": "#f3f3f2",
        },
      },
      "dark"
    ],
  },

  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  
  theme: {

    container:{
      center: true
    },

    extend: {
      fontFamily: {
        sans: ['Noto Sans TC'],
      },
      colors: {
        'dark': '#444',
        'nav-hov': '#2f3136',
        'facebook': '#1877f2',
        'google': '#ea4335'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ],
  plugins: [require("daisyui")],
}
