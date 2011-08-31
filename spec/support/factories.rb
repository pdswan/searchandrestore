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

Factory.define :link do |l|
  l.url "http://google.com"
end

Factory.define :buy_link do |l|
  l.url "http://www.itunes.com"
end

Factory.define :show do |s|
  s.association :venue
  s.group_name { Faker::Lorem.words(2).push("Trio").join(' ') }
  s.when       Time.zone.now
end

Factory.define :performance do |p|
  p.association :artist
  p.association :instrument
  p.association :show
end

Factory.define :live_artist_with_buy_links, :parent => :live_artist do |a|
  a.after_create { |artist| Factory(:buy_link, :linkable => artist) }
end

Factory.define :live_artist_with_upcoming_shows, :parent => :live_artist do |a|
  a.after_create { |artist| Factory(:performance, :artist => artist) }
end

