# coding: utf-8
module Mediasniper
  module Api
    class Abstract
      module Collection
        include Enumerable

        attr_accessor :_all, :limit, :offset

        def collection_method
          unless (@response[collection_namespace].nil? and @response[collection_namespace].size == 0)
            @response[collection_namespace].map{|v|
              self.class.new(params_for_new_instance(v[entity_name])) }
          else
            []
            raise "entity '#{entity_name}s' is undefined"
          end
        end

        def all!
          @_method  = :all
          request do
            RestClient.get("#{@url}", params: {api_key: @api_key, limit: @limit, offset: @offset}, timeout: self.class::MAX_TIMEOUT)
          end
          @_all = collection_method
          @update_all = false
          @_all
        end

        def all
          all! if @_all.nil? or @update_all == true
          @_all
        end

        def size!
          all!
          size
        end

        def size
          all.size
        end

        def first
          all.first
        end

        def first!
          all!
          first
        end

        def each &block
          all.each do |unit|
            if block_given?
              block.call unit
            else
              yield unit
            end
          end
        end

        protected

        def collection_namespace
          "#{entity_name}s"
        end

      end
    end
  end
end