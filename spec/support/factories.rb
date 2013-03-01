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

Factory.define :venue_with_upcoming_shows, :parent => :venue do |v|
  v.after_create { |venue| Factory(:show, :venue => venue) }
end

Factory.define :venue_with_videos, :parent => :venue do |v|
  v.after_create { |venue| Factory(:show_with_videos, :venue => venue) }
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

Factory.define :link_group do |lg|
  lg.name { Faker::Lorem.words(2).join(' ') }
end

Factory.define :link_group_with_links, :parent => :link_group do |lg|
  lg.after_create { |link_group| Factory(:link, :linkable => link_group) }
end

#Factory.define :show do |s|
 # s.association :venue
 # s.group_name { Faker::Lorem.words(2).push("Trio").join(' ') }
  #s.when       Time.zone.now
#end

Factory.define :show do |s|
  s.association :venue
  s.group_name { "Trio" }
  s.when       Time.zone.now
end

Factory.define :search_and_restore_show, :parent => :show do |s|
  s.search_and_restore true
end

Factory.define :featured_show, :parent => :show do |s|
  s.featured true
end

Factory.define :show_with_performances, :parent => :show do |s|
  s.after_create { |show| Factory(:performance, :show => show) }
end

Factory.define :show_with_videos, :parent => :show do |s|
  s.after_create { |show| Factory(:video, :show => show) }
end

Factory.define :performance do |p|
  p.association :artist, :factory => :live_artist
  p.association :instrument
  p.association :show
end

Factory.define :live_artist_with_buy_links, :parent => :live_artist do |a|
  a.after_create { |artist| Factory(:buy_link, :linkable => artist) }
end

Factory.define :live_artist_with_upcoming_shows, :parent => :live_artist do |a|
  a.after_create { |artist| Factory(:performance, :artist => artist) }
end

Factory.define :live_artist_with_known_associates, :parent => :live_artist_with_upcoming_shows do |a|
  a.after_create { |artist| Factory(:performance, :show => artist.upcoming_shows.first) }
end

Factory.sequence :embed_codes do |i|
  ["<iframe src=\"http://player.vimeo.com/video/27022490?title=0&amp;byline=0&amp;portrait=0&amp;color=000000\" width=\"621\" height=\"350\" frameborder=\"0\"></iframe>",
   "<iframe src=\"http://player.vimeo.com/video/19089326?title=0&amp;byline=0&amp;portrait=0&amp;color=000000\" width=\"621\" height=\"350\" frameborder=\"0\"></iframe>",
   "<iframe src=\"http://player.vimeo.com/video/2074812?title=0&amp;byline=0&amp;portrait=0&amp;color=000000\" width=\"621\" height=\"350\" frameborder=\"0\"></iframe>"][i%3]
end

Factory.define :video do |v|
  v.association :show
  v.embed_code { Factory.next(:embed_codes) }
  v.title      { Faker::Lorem.words(3).join(' ') }
end

Factory.define :live_artist_with_videos, :parent => :live_artist_with_upcoming_shows do |a|
  a.after_create { |artist| Factory(:video, :show => artist.upcoming_shows.first) }
end

Factory.define :homepage do |h|
  h.exciting_news Faker::Lorem.paragraphs(3).join("\n\n")
end

Factory.define :about do |a|
  a.title Faker::Lorem.words(2).join(' ')
  a.about Faker::Lorem.paragraphs(3).join("\n\n")
end

Factory.define :press_clipping do |p|
  p.source      'New York Times'
  p.author      'Phil Collins'
  p.date        Date.today
  p.association :link
end

Factory.define :homepage_banner do |hb|
  hb.image File.open(File.expand_path('undead.jpg', File.join(Rails.root, 'spec', 'fixtures')))
end

Factory.define :homepage_banner_with_a_url, :parent => :homepage_banner do |hb|
  hb.url 'http://google.com'
end
