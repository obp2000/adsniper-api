# coding: utf-8
module Adsniper
  module Api
    class Abstract
      module Parent
        attr_accessor :_parent, :_parent_url

        def parent_required?
          if defined? self.class::PARENT_REQUIRED and (@_parent.nil? and @_parent_url.nil?)
            raise 'Please, set parent entity'
          end
        end

        def set_parent parent, parent_url
          @_parent = parent
          @_parent_url = parent_url
        end

        def parent_url
          if !@_parent.nil?
            "#{@_parent.class.name.split('::').last.downcase}s/#{@_parent.id}/"
          elsif !@_parent_url.nil?
            @_parent_url
          else
            ""
          end
        end

      end
    end
  end
end