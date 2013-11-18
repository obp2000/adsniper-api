module Adsniper
  module Api
    module Models
      class Campaign < Adsniper::Api::Abstract
        set_required_attrs :name

        def statistics
          Adsniper::Api::Models::Statistic.new(parent: self).all
        end

        def adcreatives
          Adsniper::Api::Models::Adcreative.new(parent: self)
        end

        def targetings
          Adsniper::Api::Models::Targeting.new(parent: self)
        end

        def parent_url
          ''
        end

      end
    end
  end
end