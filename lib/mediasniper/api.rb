require "mediasniper/api/version"
require "rest_client"
require "json"
require "awesome_print"
require "hashie"
require "mediasniper/api/abstract/helper"
require "mediasniper/api/abstract/parent"
require "mediasniper/api/abstract/crud"
require "mediasniper/api/abstract/collection"
require "mediasniper/api/abstract"
require "mediasniper/api/models/account"
require "mediasniper/api/models/sub_account"
require "mediasniper/api/models/campaign"
require "mediasniper/api/models/adcreative"
require "mediasniper/api/models/demographic"
require "mediasniper/api/models/device"
require "mediasniper/api/models/rubric"
require "mediasniper/api/models/targeting"
require "mediasniper/api/models/statistic"
require "mediasniper/api/client"

module Mediasniper
  module Api
    BASE_URL = 'http://mediasniper.ru/api/'
    DEBUG = true
    SHOW_REQUESTS = true
  end
end

if Mediasniper::Api::DEBUG and Mediasniper::Api::SHOW_REQUESTS
  RestClient.log =
    Object.new.tap do |proxy|
      def proxy.<<(message)
        p message
      end
    end
end