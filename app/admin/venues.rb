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

  form(:html => { :multipart => true }) do |f|
    f.inputs *(Venue.column_names.collect(&:to_sym) - [:id, :created_at, :updated_at, :latitude, :longitude])

    f.buttons
  end
end
