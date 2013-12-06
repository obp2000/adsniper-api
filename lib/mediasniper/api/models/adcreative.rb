module Mediasniper
  module Api
    module Models
      class Adcreative < Mediasniper::Api::Abstract
        PARENT_REQUIRED = true
        set_required_attrs :type, :file # ,:size

        def statistics
          Mediasniper::Api::Models::Statistic.new(parent: self).all
        end
      end
    end
  end
end