# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Style.create([
               { name: "Pop" },
               { name: "Folk" },
               { name: "Rock" },
               { name: "Hip-hop" },
               { name: "Metal" },
               { name: "Jazz" },
               { name: "Classical" },
               { name: "Electronic" }
              ])
Instrument.create([
	{ name: "Guitar" },
	{ name: "Bass" },
	{ name: "Vocal" },
	{ name: "Drum" },
	{ name: "Keyboard" }
])
