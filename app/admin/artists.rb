ActiveAdmin.register Artist do
  belongs_to :instrument, :optional => true

  filter :name
  filter :instrument, :as => :select
  filter :bio

  index do
    column :name
    column :instrument, :sortable => 'instruments.name'
    column :website do |artist|
      link_to artist.website, artist.website, :target => '_blank' if artist.website.present?
    end
    column :created_at
    column :updated_at

    default_actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs :name => 'Basic Info' do
      f.input :name
      f.input :bio
      f.input :website
      f.input :image, :as => :file
    end

    f.inputs :name => 'Choose an existing instrument' do
      f.input :instrument, :as => :select
    end

    f.inputs :name, :for => :instrument, :name => 'Add a new instrument'

    f.buttons
  end

  show do
    attributes_table do
      row(:name)
      row(:instrument)
      row(:bio)
      row(:image) { image_tag(artist.image.thumb.url) if artist.image.present? }
      row(:website) { link_to(artist.website, artist.website, :target => '_blank') if artist.website.present? }
      row(:created_at)
      row(:updated_at)
    end

    active_admin_comments if active_admin_config.comments?
  end
end

Admin::ArtistsController.class_eval do

  protected

    def resource
      artist = super

      # if we are creating a new artist or editing an existing artist
      # we want to build a new instrument for the embedded instrument form
      if ['new', 'edit'].include?(params[:action])
        artist.build_instrument
      end

      artist
    end

    def scoped_collection
      super.scoped(:joins => :instrument, :include => :instrument)
    end

end
