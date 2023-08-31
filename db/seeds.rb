# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'
require 'net/http'
include I18n

I18n.with_locale do
  styles = %w(classic country electronic folk hip_hop jazz metal pop psychedelic rock)
  instruments = %w(guitar bass vocal drum keyboard)

  styles.each do |style_key|
    Style.create(name: I18n.t("music.style.#{style_key}"))
    puts "已建立樂風 #{style_key}"
  end
  

  instruments.each do |instrument_key|
    Instrument.create(name: I18n.t("music.instrument.#{instrument_key}"))
    puts "已建立樂器 #{instrument_key}"
  end
  
end

15.times do |i|
  fakername = Faker::Name.unique.name
  fakeremail = Faker::Internet.unique.email
  fakerpassword = '123123123'
  fakerphone = Faker::PhoneNumber.phone_number
  fakerlocation = Faker::Address.city
  fakerseniority = rand(1..20).to_s
  fakercontent = Faker::Lorem.sentence

  user = User.create!(
    name: fakername,
    email: fakeremail,
    password: fakerpassword,
    confirmed_at: Time.now
  )

  demo_profile = user.create_profile(
    phone: fakerphone,
    location: fakerlocation,
    seniority: fakerseniority,
    content: fakercontent
  )

  random_instrument = Instrument.order('RANDOM()').first
  demo_profile.instruments << random_instrument

  demo_avatar = File.binread(Rails.root.join('public', 'default_avatar.png'))
  demo_profile.avatar.attach(io: StringIO.new(demo_avatar), filename: 'default_avatar.png', content_type: 'image/png')

  puts "已建立使用者 #{i + 1}: #{fakername} - #{fakeremail}"
end

demo_avatar = File.binread(Rails.root.join('public', 'zooey.png'))

User.create!(
  name: 'Zooey Deschanel',
  email: 'zooey@gg.gg',
  password: '123123123',
  confirmed_at: Time.now
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
puts "已建立使用者 Zooey"
