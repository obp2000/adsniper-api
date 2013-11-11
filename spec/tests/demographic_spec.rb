require "spec_helper"

describe Adsniper::Api::Models::Demographic do

  before(:all) do
    @demographics = Adsniper::Api::Models::Demographic.new(api_key: MainHelper.api_key)
  end

  it '#all' do
    expect(@demographics.all).to be_a_kind_of(Hash)
  end

  it '#continents' do
    expect(@demographics.continents).to be_a_kind_of(Array)
  end

end