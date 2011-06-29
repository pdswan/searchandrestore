ActiveAdmin.register Video do
  form do |f|
    f.inputs do
      f.input :show
      f.input :url
    end

    f.buttons
  end
end
