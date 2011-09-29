ActiveAdmin.register About do
  menu :label => 'About', :priority => 2

  controller do
    def index
      redirect_to edit_admin_about_path(resource)
    end

    protected

      def resource
        @about ||= (About.last || About.create)
      end
  end
  
end
