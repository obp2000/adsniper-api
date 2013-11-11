module Adsniper
  module Api
    module Models
      class Statistic < Adsniper::Api::Abstract
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