ActiveAdmin.register Artist do
  index do
    column :name
    column :created_at
    column :updated_at

    default_actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :name
      f.input :bio
      f.input :image, :as => :file
    end
    f.buttons
  end

  sidebar :images, :only => [:edit] do |*block_args|
    link_to "Add/Edit Artist Images", '#'
  end
end
