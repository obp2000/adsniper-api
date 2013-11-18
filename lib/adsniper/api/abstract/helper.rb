# coding: utf-8
module Adsniper
  module Api
    class Abstract
      module Helper
        @@_required_attrs = []

        def default_url
          "#{parent_url}#{entity_name}s"
        end

        def set_api_key api_key
          if !api_key.nil?
            @api_key = api_key
          elsif @_parent.nil? and @_parent.api_key.nil?
            raise 'undefined api_key'
          else
            @api_key = @_parent.api_key
          end
        end

        def attributes
          @_arguments
        end

        protected

        def entity_name
          self.class.name.to_s.split('::').last.downcase
        end

        def make_request
          @_request = @_arguments.merge! @_request

          parent_required?

          if @_request.size > 0
            check_required_params
            @_request.api_key = @api_key
          end

          make_url
        end

        def params_for_new_instance args = {}
          {
            arguments: args,
            api_key: @api_key,
            parent_url: parent_url
          }
        end

        def make_url
          @url ||= "#{Adsniper::Api::BASE_URL}#{default_url}"
        end

        def check_required_params
          raise 'undefined required attribute "id"' if [:read,:update,:delete].include? @_method and @id.nil?
          if [:create,:update].include? @_method
            required = self.class.check_attrs(@_request)
            unless required.size == 0
                raise "undefined required attributes '#{required.join(',')}'"
            end
          end
        end

        def parse_response _response
          @_response = _response

          begin
            unless @_method == :delete
              @response = Hashie::Mash.new(JSON.parse(@_response))
            else
              @response = true if @_response.code == 200
            end
          rescue Exception => e
            @response = {'error' => "response is not in json format: #{@raw_response.to_s}"}
          end

          @response
        end

        def update_collection?
          @update_all = true if [:create,:update,:delete].include? @_method
        end

        def before_request
          ap "#{@_method} - #{default_url}" if Adsniper::Api::DEBUG
        end

        def after_response
          ap @response if Adsniper::Api::DEBUG
        end

        def request
          begin
            before_request
            make_request
            parse_response yield
            update_collection?
            after_response
          rescue Exception => e
            raise e
          end
        end

        def extract_entity unit
          unit[entity_name]
        end
      end
    end
  end
end