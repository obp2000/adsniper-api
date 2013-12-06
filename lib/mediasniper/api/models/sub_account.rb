module Mediasniper
  module Api
    module Models
      class SubAccount < Mediasniper::Api::Models::Account
        PARENT_REQUIRED = true
        @required_attributes = [:login, :email]

        def collection_method
          unless @response[collection_namespace].nil? and @response[collection_namespace].size == 0
            @response[collection_namespace].map{|v|
              sub = self.class.new(params_for_new_instance(v[entity_name]))
              sub.api_key = v[entity_name][:api_key]
              sub
            }
          else
            []
            raise "entity '#{entity_name}s' is undefined"
          end
        end
      end
    end
  end
end






