# coding: utf-8
module Adsniper
  module Api
    class Client

      attr_accessor :api_key

      def initialize api_key, args = {}
        @api_key = api_key
      end

      def create_account email, password
        account.sub_accounts.create(email: email, login: email, password: password)
      end

      def account
        Adsniper::Api::Models::Account.new(hash_for_init).first
      end

      def geo
        Adsniper::Api::Models::Demographic.new(hash_for_init).all
      end

      def devices
        Adsniper::Api::Models::Device.new(hash_for_init).all
      end

      def rubrics
        Adsniper::Api::Models::Rubric.new(hash_for_init).all
      end

      private

      def hash_for_init
        {
          api_key: @api_key
        }
      end
    end
  end
end