Factory.define :user do |u|
  u.email Faker::Internet.email
  u.password "password123"
  u.password_confirmation "password123"
end

Factory.define :admin, :parent => :user do |u|
  u.roles [:admin]
end

Factory.define :instrument do |i|
  i.name 'Jazz Flute'
end

Factory.define :venue do |v|
  v.name 'Birdland'
  v.address '315 West 44th Street New York, NY'
  v.their_words { Faker::Lorem.paragraphs.join("\n") }
  v.our_words   { Faker::Lorem.paragraphs.join("\n") }
end
