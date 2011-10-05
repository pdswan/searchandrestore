ActiveAdmin.register Homepage do
  menu :label => 'Homepage', :priority => 1

  form do |f|
    f.inputs do
      f.input :exciting_news
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
