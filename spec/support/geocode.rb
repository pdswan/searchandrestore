##
# Mock HTTP request to geocoding service.
#
module Geocoder
  module Lookup
    class Base
      private #-----------------------------------------------------------------
      def read_fixture(file)
        File.read(File.join("#{::Rails.root}/spec/fixtures", file)).strip.gsub(/\n\s*/, "")
      end
    end

    class Google < Base
      private #-----------------------------------------------------------------
      def fetch_raw_data(query, reverse = false)
        raise TimeoutError if query == "timeout"
        raise SocketError if query == "socket_error"
        file = case query
          when "no results";   :no_results
          when "no locality";  :no_locality
          when "no city data"; :no_city_data
          else                 :birdland
        end
        read_fixture "google_#{file}.json"
      end
    end
  end
end
