require "spec_helper"

describe Adsniper::Api::Models::Rubric do

  before(:all) do
    @campaign = Adsniper::Api::Models::Campaign.new(api_key: MainHelper.api_key).create MainHelper.load_fixture(:campaign)
    @statistics = Adsniper::Api::Models::Statistic.new(parent: @campaign)
  end

  after(:all) do
    @campaign.delete
  end

  it '#all' do
    expect(@statistics.all).to be_a_kind_of(Hash)
  end

end