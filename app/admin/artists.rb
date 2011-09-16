ActiveAdmin.register Artist do
  belongs_to :instrument, :optional => true

  filter :name
  filter :state, :as => :select, :collection => Artist.state_options
  filter :instrument, :as => :select
  filter :bio

  index do
    column :name
    column :state do |artist|
      artist.state.titleize
    end
    column :instrument, :sortable => 'instruments.name'
    column :website do |artist|
      link_to artist.website, artist.website, :target => '_blank' if artist.website.present?
    end
    column :created_at
    column :updated_at

    default_actions
  end

  form(:html => { :enctype => 'multipart/form-data' }) do |f|
    f.inputs :name => 'Basic Info' do
      f.input :name
      f.input :bio
      f.input :website
      f.input :image, :as => :file, :hint => 'Image will be resized to 140x140px'
      f.input :state, :as => :select, :include_blank => false, :collection => Artist.state_options
    end

    f.inputs :name => 'Choose an existing instrument' do
      f.input :instrument, :as => :select, :input_html => {:'data-placeholder' => 'Choose an instrument...', :class => 'chzn-select'}
    end

    f.object.build_instrument
    f.inputs :name, :for => :instrument, :name => 'Add a new instrument'

    f.has_many :buy_links do |link|
      link.input :title
      link.input :url
    end

    f.buttons
  end

  show do
    attributes_table do
      row(:name)
      row(:state) { artist.state.titleize }
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
        3.times { artist.buy_links.build }
      end

      artist
    end

    def scoped_collection
      super.joins("LEFT JOIN instruments ON instruments.id = artists.instrument_id").
        includes(:instrument)
    end

end
