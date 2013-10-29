# coding: utf-8
module Adsniper
  module Api
    class Abstract
      module Crud

        def create params = {}
          @_method  = :create
          @_request = params

          request do
            RestClient.post(@url, @_request)
          end

          self.class.new(params_for_new_instance extract_entity(@response))
        end

        def read id = @id
          @id = id
          @_method = :read
          request do
            RestClient.get("#{@url}/#{@id}", params: {api_key: @api_key})
          end
          @_arguments.merge! Hashie::Mash.new(extract_entity(@response))
          self
        end

        def update params = {}
          @_method  = :update
          @_request = params
          request do
            RestClient.put("#{@url}/#{@id}", @_request)
          end

          self.class.new(params_for_new_instance extract_entity(@response))
        end

        def delete id = @id
          @id = id
          @_method  = :delete
          request do
            RestClient.delete("#{@url}/#{@id}", :params => {api_key: @api_key})
          end
        end
      end
    end
  end
end

