require "spec_helper"

describe Mediasniper::Api::Models::Device do

  before(:all) do
    @devices = Mediasniper::Api::Models::Device.new(api_key: MainHelper.api_key)
  end

  it '#all' do
    expect(@devices.all).to be_a_kind_of(Hash)
  end

end