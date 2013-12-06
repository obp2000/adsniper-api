module Mediasniper
  module Api
    module Models
      class Statistic < Mediasniper::Api::Abstract
        PARENT_REQUIRED = true
        def collection_method
          Hashie::Mash.new(@response['statistic'])
        end

        def default_url
          "/#{parent_url}/#{entity_name}"
        end
      end
    end
  end
end