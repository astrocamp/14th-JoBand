# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Style.create([
               { name: 'Pop' },
               { name: 'Folk' },
               { name: 'Rock' },
               { name: 'Hip-hop' },
               { name: 'Metal' },
               { name: 'Jazz' },
               { name: 'Classical' },
               { name: 'Electronic' }
             ])
Instrument.create([
                    { name: 'Guitar' },
                    { name: 'Bass' },
                    { name: 'Vocal' },
                    { name: 'Drum' },
                    { name: 'Keyboard' }
                  ])

demo_avatar = File.binread(Rails.root.join('public', 'zooey.png'))

User.create!(
  name: 'Zooey Deschanel',
  email: 'zooey@gg.gg',
  password: '123123123',
  password_confirmation: "123123123"
)

demo_profile = User.find_by(email: 'zooey@gg.gg').create_profile(
  phone: '3345678',
  location: 'Los Angeles',
  seniority: '20',
  content: 'Hi, welcome to Joband ! You can make your music life become amazing !'
)

demo_profile.instruments << Instrument.find_by(name: 'Vocal')

demo_profile.avatar.attach(
  io: StringIO.new(demo_avatar),
  filename: 'zooey.png',
  content_type: 'image/png'
)
