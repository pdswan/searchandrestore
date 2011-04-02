module Haml
  module Filters
    module Code
      include ::Haml::Filters::Base

      def render(text)
        response = ''
        engine = Haml::Engine.new(text)
        response << engine.render
        response << "<pre><code>" << text << "</code></pre>"
        response
      end
    end
  end
end

