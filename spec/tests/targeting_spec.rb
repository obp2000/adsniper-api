require "spec_helper"

describe Adsniper::Api::Models::Targeting do

  before(:all) do
    @campaign = Adsniper::Api::Models::Campaign.new(api_key: MainHelper.api_key).create MainHelper.load_fixture(:campaign)
  end



  it '#all' do
    #expect(@rubrics.all).to be_a_kind_of(Hash)
  end

end