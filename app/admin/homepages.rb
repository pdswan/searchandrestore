ActiveAdmin.register Homepage do
  menu :label => 'Homepage', :priority => 1

  form do |f|
    f.inputs do
      f.input :exciting_news
      f.input :well_hello_there, :hint => "If you leave this text blank it will pull from the text you have entered for the about section. Otherwise this text will be parsed as textile (<a href='http://redcloth.org/textile' target='_blank'>http://redcloth.org/textile</a>)."
      f.input :video, :input_html => { :'data-placeholder' => 'Select a video...', :class => 'chzn-select' }
      f.input :video_description
    end

    f.buttons
  end

  controller do
    def index
      redirect_to edit_admin_homepage_path(resource)
    end

    protected

      def resource
        @homepage ||= (Homepage.last || Homepage.create)
      end
  end
end
