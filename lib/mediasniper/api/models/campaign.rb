module Mediasniper
  module Api
    module Models
      class Campaign < Mediasniper::Api::Abstract
        set_required_attrs :name

        def statistics
          Mediasniper::Api::Models::Statistic.new(parent: self).all
        end

        def adcreatives
          Mediasniper::Api::Models::Adcreative.new(parent: self)
        end

        def targeting
          Mediasniper::Api::Models::Targeting.new(parent: self).all
        end

        def parent_url
          ''
        end

      end
    end
  end
end