ActiveAdmin.register About do
  menu :label => 'About', :priority => 2

  form do |f|
    f.inputs do
      f.input :about, :hint => "This text will be parsed as textile (<a href='http://redcloth.org/textile' target='_blank'>http://redcloth.org/textile</a>). Paste \"==&lt;!-- homepage --&gt;==\" (no quotes) to designate the content that will show on the homepage. If you don't manually designate the text it will be truncated at 350 characters.".html_safe
    end

    f.buttons
  end

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
