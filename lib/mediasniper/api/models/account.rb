module Mediasniper
  module Api
    module Models
      class Account < Mediasniper::Api::Abstract
        @required_attributes = [:login, :email]

        def collection_method
          unless @response['account'].nil?
            [self.class.new(params_for_new_instance @response['account'])]
          else
            []
          end
        end

        def sub_accounts
          Mediasniper::Api::Models::SubAccount.new(parent: self)
        end

        def campaigns
          Mediasniper::Api::Models::Campaign.new(parent: self)
        end
      end
    end
  end
end