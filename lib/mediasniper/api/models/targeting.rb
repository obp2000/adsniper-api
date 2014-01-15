module Mediasniper
  module Api
    module Models
      class Targeting < Mediasniper::Api::Abstract
        PARENT_REQUIRED = true

        protected

        def collection_namespace
          'targeting'
        end
      end
    end
  end
end