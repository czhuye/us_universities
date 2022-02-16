# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "csv"
# require "open-uri"

University.delete_all
State.delete_all

csv_data = File.read("db/states.csv")
states = CSV.parse(csv_data, headers: true, encoding: "utf-8")

states.each do |s|
  State.create(
    state:     s["state"],
    latitude:  s["latitude"],
    longitude: s["longitude"],
    name:      s["name"]
  )
end

url = "https://storage.googleapis.com/kagglesdsdata/datasets/10525/14746/schoolInfo.json?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=gcp-kaggle-com%40kaggle-161607.iam.gserviceaccount.com%2F20220215%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20220215T144613Z&X-Goog-Expires=259199&X-Goog-SignedHeaders=host&X-Goog-Signature=8c2352fa2c7a92edec3d7bfcdedd2bb75aab13248cb3a268d48b0cd5638a69d9132a24aecc703553a62ab2d41779178854cb38e51c5f6cfe0c383e61d430e44c54edb71fbd76514caf1a77e530ad92aa7fad01c274ff6482b733ae118167e793cbfbfa94c7dfc608a1112c2f814f1eb88924d83102d41c212cff07df6d9fc8ce18e5f1f648d0d5abfbba8b394995599f1f10b5ae9c0cc3e4b9b5fd8ee389743c26091cc0958cea8eac019b6eb0182a01c16f784d27c79b033adeeb0c4ae516bd737a28f5e0b2b39d5dd293daa756e9d0487c672c6b254b59568853bfc872cfadce2289a78a358e75315477a450d901b62330cf729a68957a390f910af6559d6a"
universities = JSON.parse(URI.open(url).read)
universities.each do |uni|
  s = State.find_or_create_by(state: uni["state"])

  next unless s&.valid?

  s.universities.create(
    photo: uni["primaryPhotoThumb"],
    city:  uni["city"],
    zip:   uni["zip"],
    # state: uni["state"],
    rank:  uni["rankingDisplayRank"],
    name:  uni["displayName"]
  )
end

# puts University.count

# production_company = ProductionCompany.find_or_create_by(name: m["production_company"])

#   if production_company&.valid?
#     movie = production_company.movies.create(
#       title:        m["original_title"],
#       year:         m["year"],
#       duration:     m["duration"],
#       description:  m["description"],
#       average_vote: m["avg_vote"]
#     )

#     unless movie&.valid?
#       puts "Invalid movie #{m['original_title']}"
#       next
#     end

#     genres = m["genre"].split(",").map(&:strip)
#     genres.each do |genre_name|
#       genre = Genre.find_or_create_by(name: genre_name)
#       MovieGenre.create(movie: movie, genre: genre)
#     end
