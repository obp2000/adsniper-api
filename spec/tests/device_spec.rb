require "spec_helper"

describe Adsniper::Api::Models::Device do

  before(:all) do
    @devices = Adsniper::Api::Models::Device.new(api_key: MainHelper.api_key)
  end



  it '#all' do
    expect(@devices.all).to be_a_kind_of(Hash)
  end

end