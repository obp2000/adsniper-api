module Mediasniper
  module Api
    module Models
      class Targeting < Mediasniper::Api::Abstract
        PARENT_REQUIRED = true

        def collection_method
          unless @response['targeting'].nil?
            self.class.new(params_for_new_instance(@response['targeting']))
          else
            nil
          end
        end
      end
    end
  end
end