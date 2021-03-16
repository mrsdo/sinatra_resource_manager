require 'faker'
puts "Running DB seed..."

# # Don't let seed duplicate data more than once
puts "Cleaning database..."

# puts "Creating sample Users..."
# User.create([
#                 {
#                     fname: "Neeson",
#                     lname: "Grant",
#                     username: "ngrant",
#                     email: "new@email.com",
#                     password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
#                     created_at: "2018-04-14 02:09:44.528632",
#                     updated_at: "2018-04-19 16:22:55.254084"
#                 },
#                 {
#                     fname: "Salma",
#                     lname: "Tine",
#                     username: "stine",
#                     email: "salma@hotmail.com",
#                     password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
#                     created_at: "2018-04-14 02:17:30.310658",
#                     updated_at: "2018-04-14 02:17:30.310658"
#                 },
#                 {
#                     fname: "Rend",
#                     lname: "Miller",
#                     username: "rmiller",
#                     email: "hend@anything.com",
#                     password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
#                     created_at: "2018-04-16 23:44:09.971071",
#                     updated_at: "2018-04-16 23:44:09.971071"
#                 },
#                 {
#                     fname: "Eddie",
#                     lname: "Opara",
#                     username: "eopara",
#                     email: "eopara@gmail.com",
#                     password_digest: "$2a$12$n/CEaft4d0qmEUgxnNAPFurBBgw4PI9eVrv/rUewwlTFPn7NY/Yuq",
#                     created_at: "2021-02-22 18:42:08.345412",
#                     updated_at: "2021-02-22 18:42:08.345412"
#                 }
#             ])
# puts "Users Completed..."
puts "......."
puts "Cleaning Listings Table"
Listing.destroy_all

puts "......."

puts 'Adding Listings'
num = 0
30.times do
  percent = num / 30 * 100
  sleep(0.05)
  print "...#{num += 1} seconds remaining\r"
  Listing.create({
                   'name' => Faker::Address.street_name,
                   'tag_name' => Faker::Marketing.buzzwords,
                   'status' => "#{(1..2).to_a.sample}", # Active/Inactive Faker?
                   'first_listed' => Faker::Date.between(from: '2001-03-11', to: '2021-03-14'),
                   'bedrooms' => "#{(1..5).to_a.sample} BR",
                   'bathrooms' => "#{(1..5).to_a.sample} BA",
                   'summary' => Faker::Lorem.paragraph(sentence_count: 2, supplemental: false,
                                                       random_sentences_to_add: 4),
                   'sqft' => "#{(900..6000).to_a.sample} sq. ft.",
                   'asking_price' => "$#{(10_000..30_000_000).to_a.sample}",

                   'photo_1' => Faker::LoremFlickr.image(size: '320x240', search_terms: ['homes_for_sale?random=' + (1..30).to_s]),
                   'photo_2' => Faker::LoremFlickr.image(size: '320x240', search_terms: ['homes_for_sale?random=' + (1..30).to_s]),
                   'photo_3' => Faker::LoremFlickr.image(size: '320x240', search_terms: ['homes_for_sale?random=' + (1..30).to_s]),
                   'photo_4' => Faker::LoremFlickr.image(size: '320x240', search_terms: ['homes_for_sale?random=' + (1..30).to_s]),
                   'user_id' => User.ids.sample,
                   'phone' => Faker::PhoneNumber.unique.cell_phone,
                   'community' => 'Homely'
                 })
  num += 1

  system('clear')
end