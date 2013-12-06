module Mediasniper
  module Api
    module Models
      class Rubric < Mediasniper::Api::Abstract
        def collection_method
          Hashie::Mash.new(@response)
        end
      end
    end
  end
end