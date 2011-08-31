ActiveAdmin.register Video do

  controller do
    def scoped_collection
      super.scoped(:joins => :show, :include => :show)
    end
  end

  filter :title
  filter :show, :as => :select
  filter :created_at
  filter :updated_at
  
  index do
    column :title
    column :url
    column :thumbnail do |video|
      image_tag video.thumbnail.tiny.url
    end
    column :show, :sortable => 'shows.group_name'
    column :created_at
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs do
      f.input :show, :hint => "<a href='/admin/shows/new'>Add the show</a> where this video took place to associate it with a venue, artists, and instruments".html_safe, :input_html => {:'data-placeholder' => 'Select a show...', :class => 'chzn-select', :style => 'width: 500px !important;'}
      f.input :title, :hint => 'If left blank, this will be automatically populated from the title of the vimeo video. It can be edited afterwards.'
      f.input :url, :hint => 'Paste the vimeo link here; e.g. http://vimeo.com/25519509' 
    end

    f.buttons
  end

  show do
    attributes_table do
      row(:show)
      row(:title)
      row(:url)        { link_to(assigns[:video].url, assigns[:video].url, :target => '_blank') if assigns[:video].url.present? }
      row(:embed_code) { assigns[:video].embed_code.html_safe }
      row(:thumbnail)  { image_tag(assigns[:video].thumbnail.tiny.url) if assigns[:video].thumbnail.present? }
      row(:created_at)
      row(:updated_at)
    end

    active_admin_comments if active_admin_config.comments?
  end
end
