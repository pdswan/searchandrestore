ActiveAdmin.register PressClipping do

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
        press_clipping.build_link
        press_clipping
      end
  end
  
end
