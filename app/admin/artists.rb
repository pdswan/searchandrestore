ActiveAdmin.register Artist do
  index do
    column :name
    column :website do |artist|
      link_to artist.website, artist.website, :target => '_blank' if artist.website.present?
    end
    column :created_at
    column :updated_at

    default_actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :website
      f.input :image, :as => :file
    end

    f.buttons
  end

  show do
    attributes_table do
      row(:name)
      row(:bio)
      row(:image) { image_tag(artist.image.thumb.url) if artist.image.present? }
      row(:website) { link_to(artist.website, artist.website, :target => '_blank') if artist.website.present? }
      row(:created_at)
      row(:updated_at)
    end

    active_admin_comments if active_admin_config.comments?
  end
end
