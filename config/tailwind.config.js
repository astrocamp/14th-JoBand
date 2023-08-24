// const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  
  theme: {
    extend: {
      colors: {
        'dark': '#444',
        'nav-hov': '#2f3136',
        'facebook': '#1877f2',
        'google': '#ea4335'
      },
    },
  },
  // plugins: [
  //   require('@tailwindcss/forms'),
  //   require('@tailwindcss/aspect-ratio'),
  //   require('@tailwindcss/typography'),
  //   require('@tailwindcss/container-queries'),
  // ],
  // plugins: [require("daisyui")],
}
