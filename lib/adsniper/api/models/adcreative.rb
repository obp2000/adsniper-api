module Adsniper
  module Api
    module Models
      class Adcreative < Adsniper::Api::Abstract
        PARENT_REQUIRED = true
        set_required_attrs :type, :file # ,:size

        def statistics
          Adsniper::Api::Models::Statistic.new(parent: self).all
        end
      end
    end
  end
end