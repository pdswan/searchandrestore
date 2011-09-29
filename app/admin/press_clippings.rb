ActiveAdmin.register PressClipping do

  index do
    column :source
    column :author
    column :date
    column :link do |press_clipping|
      link_to press_clipping.link.title, press_clipping.link.url, :target => '_blank'
    end
    column :created_at
    column :updated_at

    default_actions
  end

  show do
    attributes_table do
      row(:source)
      row(:author)
      row(:date)
      row(:link) { link_to press_clipping.link.title, press_clipping.link.url, :target => '_blank' }
      row(:created_at)
      row(:updated_at)
    end

    active_admin_comments if active_admin_config.comments?
  end

  form do |f|
    f.inputs do
      f.input :source
      f.input :author
      f.input :date
    end

    f.inputs :title, :url, :for => :link

    f.buttons
  end

  controller do
    protected

      def resource
        press_clipping = super
        press_clipping.build_link unless press_clipping.link.present?
        press_clipping
      end
  end
  
end
