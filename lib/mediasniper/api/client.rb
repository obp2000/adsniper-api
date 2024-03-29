# coding: utf-8
module Mediasniper
  module Api
    class Client

      attr_accessor :api_key

      def initialize api_key, args = {}
        @api_key = api_key
      end

      def create_account email, password
        account.sub_accounts.create(email: email, login: email, password: password)
      end

      def sub_account id
        account.sub_accounts.read id
      end

      def update_sub_account
        account.sub_accounts.update(email: email, login: email, password: password)
      end

      def account
        Mediasniper::Api::Models::Account.new(hash_for_init).first
      end

      def geo
        Mediasniper::Api::Models::Demographic.new(hash_for_init).all
      end

      def devices
        Mediasniper::Api::Models::Device.new(hash_for_init).all
      end

      def rubrics
        Mediasniper::Api::Models::Rubric.new(hash_for_init).all
      end

      def campaigns
        Mediasniper::Api::Models::Campaign.new(hash_for_init).all
      end

      def creatives_kinds
        Mediasniper::Api::Models::AdcreativeSize.new(hash_for_init).all
      end

      def campaign id
        raise 'campaign id must be defined' if id.nil?
        Mediasniper::Api::Models::Campaign.new(hash_for_init).read id
      end

      def statistic_for_campaign id, params = {}
        raise 'campaign id must be defined' unless id.present?
        Mediasniper::Api::Models::Statistic.new(hash_for_init.merge({parent_url: "campaigns/#{id}",request: params})).all
      end

      def create_campaign params
        raise 'campaign params must be kind of Hash' unless params.present?
        Mediasniper::Api::Models::Campaign.new(hash_for_init).create params
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