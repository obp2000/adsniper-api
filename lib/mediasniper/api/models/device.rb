module Mediasniper
  module Api
    module Models
      class Device < Mediasniper::Api::Abstract
        def collection_method
          Hashie::Mash.new(@response)
        end
      end
    end
  end
end