module Adsniper
  module Api
    module Models
      class Account < Adsniper::Api::Abstract
        @required_attributes = [:login, :email]

        def collection_method
          unless @response['account'].nil?
            [self.class.new(params_for_new_instance @response['account'])]
          else
            []
          end
        end

        def sub_accounts
          Adsniper::Api::Models::SubAccount.new(parent: self)
        end

        def campaigns
          Adsniper::Api::Models::Campaign.new(parent: self)
        end
      end
    end
  end
end