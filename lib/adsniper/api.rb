require "adsniper/api/version"
require "rest_client"
require "json"
require "awesome_print"
require "hashie"
require "adsniper/api/abstract/helper"
require "adsniper/api/abstract/parent"
require "adsniper/api/abstract/crud"
require "adsniper/api/abstract/collection"
require "adsniper/api/abstract"
require "adsniper/api/models/account"
require "adsniper/api/models/campaign"
require "adsniper/api/models/adcreative"
require "adsniper/api/models/demographic"
require "adsniper/api/models/device"
require "adsniper/api/models/rubric"
require "adsniper/api/models/targeting"
require "adsniper/api/models/statistic"

module Adsniper
  module Api
    BASE_URL = 'http://mediasniper.ru/api'
    DEBUG = true
    SHOW_REQUESTS = true
  end
end

if Adsniper::Api::DEBUG and Adsniper::Api::SHOW_REQUESTS
  RestClient.log =
    Object.new.tap do |proxy|
      def proxy.<<(message)
        p message
      end
    end
end