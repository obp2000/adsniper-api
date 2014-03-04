module Mediasniper
  module Api
    module Models
      class AdcreativeSize < Mediasniper::Api::Abstract

        def default_url
          'adcreative_sizes'
        end

        def collection_method
          Hashie::Mash.new(@response)
        end
      end
    end
  end
end