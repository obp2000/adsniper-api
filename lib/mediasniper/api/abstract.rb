# coding: utf-8
module Mediasniper
  module Api
    class Abstract
      MAX_TIMEOUT = 30

      include Mediasniper::Api::Abstract::Helper
      include Mediasniper::Api::Abstract::Parent
      include Mediasniper::Api::Abstract::Collection
      include Mediasniper::Api::Abstract::Crud

      class << self
        attr_accessor :required_attributes, :all_attributes
        @all_attributes = []
        @required_attributes = []

        def set_required_attrs *args
          @required_attributes = args.map(&:to_sym)
        end

        def check_attrs hash
          undefined_attrs = []
          @required_attributes.each do |attribute|
            undefined_attrs << attribute unless hash.include? attribute
          end
          undefined_attrs
        end
      end

      attr_accessor :_method, :_request, :_response, :response, :api_key, :update_all, :_arguments, :url, :id

      def initialize args = {}
        @_arguments = Hashie::Mash.new(args[:arguments]) || Hashie::Mash.new()
        @id = @_arguments.id
        @_request = Hashie::Mash.new(args[:request]) || Hashie::Mash.new()
        set_parent args[:parent], args[:parent_url]
        set_api_key args[:api_key]

      end

    end
  end
end