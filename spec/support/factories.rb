Factory.define :user do |u|
  u.email Faker::Internet.email
  u.password "password123"
  u.password_confirmation "password123"
end

Factory.define :admin, :parent => :user do |u|
  u.roles [:admin]
end

Factory.sequence :instrument_name do |n|
  ['Jazz Flute', 'Air Guitar', 'Bongos', 'Lute'][n-1] || "Instrument #{n}"
end

Factory.define :instrument do |i|
  i.name { Factory.next(:instrument_name) }
end

Factory.define :venue do |v|
  v.name 'Birdland'
  v.address '315 West 44th Street New York, NY'
  v.their_words { Faker::Lorem.paragraphs.join("\n") }
  v.our_words   { Faker::Lorem.paragraphs.join("\n") }
end

Factory.define :artist do |a|
  a.name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
  a.bio  Faker::Lorem.paragraphs.join("\n")
  a.association :instrument
end

Factory.define :live_artist, :parent => :artist do |a|
  a.state 'live'
end

