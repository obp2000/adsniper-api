module Adsniper
  module Api
    module Models
      class Adcreative < Adsniper::Api::Abstract
        PARENT_REQUIRED = true
        set_required_attrs :type, :size, :file
      end
    end
  end
end