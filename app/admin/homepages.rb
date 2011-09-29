ActiveAdmin.register Homepage do
  menu :label => 'Homepage', :priority => 1

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
