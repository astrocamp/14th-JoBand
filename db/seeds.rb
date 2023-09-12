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

fakewords = [
  "萬物於我皆為春秋，而吾將與時俱舞。",
  "塵世煙雲，皆是虛幻之事，莫過於心靈之清明。",
  "大道之行也，天下為公，吾其獨樂樂乎？",
  "人生如夢，一切皆虛。悟己者智，悟道者明。",
  "天地萬物，與我何干？內觀自心，得天地之間。",
  "虛無即是真實，真實亦可化為虛無。",
  "逍遙於自然之間，心隨物動，物隨心生。",
  "欲去一切，方得無所不在。",
  "萬物皆妄，吾亦妄言之。妄言既妄，妄言誰妄？",
  "安得為紅顏，不負春風？吾有心而忘形。"
]

5.times do |i|
  fakername = Faker::Name.unique.name
  fakeremail = Faker::Internet.unique.email
  fakerpassword = '123123123'
  fakerphone = Faker::PhoneNumber.phone_number
  fakerlocation = Faker::Address.state
  fakerseniority = rand(0..7)
  fakercontent = fakewords.sample

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

  avatar_url = Net::HTTP.get(URI.parse("https://avatars.dicebear.com/api/shapes/Cookie.svg"))

  demo_profile.avatar.attach(io: StringIO.new(avatar_url), filename: 'avatar.svg', content_type: 'image/svg+xml')

  demo_avatar = File.binread(Rails.root.join('public', 'default_avatar.png'))
  demo_profile.avatar.attach(io: StringIO.new(demo_avatar), filename: 'default_avatar.png', content_type: 'image/png')

  puts "已建立使用者 #{i + 1}: #{fakername} - #{fakeremail}"
end

demo_avatar = File.binread(Rails.root.join('public', 'zooey.png'))

demo_band_avatar = File.binread(Rails.root.join('public', 'band_avatar.png'))

demo_user = User.create!(
  name: 'Zooey Deschanel',
  email: 'zooey@gg.gg',
  password: '123123123',
  confirmed_at: Time.now
)

demo_profile = demo_user.create_profile(
  phone: '3345678',
  location: 'Los Angeles',
  seniority:  3,
  content: 'Hi, welcome to Joband ! You can make your music life become amazing !'
)

demo_profile.instruments << Instrument.find_by(name: '主唱')

demo_band = User.find_by(email: 'zooey@gg.gg').bands.create(
  name: "大貓會社",
  area: 0,
  content: "你好～歡迎參觀我的樂團",
  state: 0,
  founded_at: "2023-09-01"
)

demo_band.band_members.first.update(identity: :leader, role: "主唱")

demo_band.styles << Style.find_by(name: '搖滾')

demo_profile.avatar.attach(
  io: StringIO.new(demo_avatar),
  filename: 'zooey.png',
  content_type: 'image/png'
)
puts "已建立使用者 Zooey"

demo_band.avatar.attach(
  io: StringIO.new(demo_band_avatar),
  filename: 'band_avatar.png',
  content_type: 'image/png'
)
