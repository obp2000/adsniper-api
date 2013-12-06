module Mediasniper
  module Api
    module Models
      class Demographic < Mediasniper::Api::Abstract
        def collection_method
          Hashie::Mash.new(@response)
        end

        def continents
          ap all.keys
        end

      end
    end
  end
end