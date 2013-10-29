module Adsniper
  module Api
    module Models
      class Demographic < Adsniper::Api::Abstract
        def collection_method
          Hashie::Mash.new(@response)
        end
      end
    end
  end
end