ActiveAdmin.register Venue do
  index do
    column :name
    column :address
    column :website do |venue|
      link_to venue.website, venue.website, :target => '_blank' if venue.website.present?
    end
    column :created_at
    column :updated_at

    default_actions
  end

  form(:html => { :enctype => 'multipart/form-data' }) do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :website
      f.input :image, :as => :file, :hint => 'Image will be resized to 160x160px'
      f.input :our_words
      f.input :their_words
      f.input :music_every_night
      f.input :reservations
      f.input :capacity
      f.input :age_restriction
      f.input :food_and_drink
    end

    f.buttons
  end
end
