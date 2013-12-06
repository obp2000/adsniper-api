require "spec_helper"

describe Mediasniper::Api::Models::Statistic do

  before(:all) do
    @campaign = Mediasniper::Api::Models::Campaign.new(api_key: MainHelper.api_key).create MainHelper.load_fixture(:campaign)
    @statistics = Mediasniper::Api::Models::Statistic.new(parent: @campaign)

    @adcreative = Mediasniper::Api::Models::Adcreative.new(api_key: MainHelper.api_key, parent: @campaign).create MainHelper.load_fixture(:adcreative)
    @ad_statistics = Mediasniper::Api::Models::Statistic.new(parent: @adcreative)
  end

  after(:all) do
    @campaign.delete
  end

  it '#all' do
    expect(@statistics.all).to be_a_kind_of(Hash)
  end

  it '#all for adcreative' do
    expect(@ad_statistics.all).to be_a_kind_of(Hash)
  end

end