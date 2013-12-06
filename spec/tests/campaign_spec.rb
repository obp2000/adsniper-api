require "spec_helper"

describe Mediasniper::Api::Models::Campaign do

  before(:all) do
    @campaigns = Mediasniper::Api::Models::Campaign.new(api_key: MainHelper.api_key)
    @campaigns.each(&:delete)
    @campaigns.create MainHelper.load_fixture(:campaign)
    @first = @campaigns.first
  end

  it '#create' do
    @campaigns.create MainHelper.load_fixture(:campaign)
    expect(@campaigns.size!).to eq(2)
  end

  it '#read' do
    expect(@first.read.attributes).to include(name: 'test')
  end

  it '#update' do
    @first.update name: 'update_test'
    expect(@first.read.attributes).to include(name: 'update_test')
  end

  it '#statistics' do
    expect(@first.statistics).to be_a_kind_of(Hash)
  end

  it '#all' do
    expect(@campaigns.all).to be_a_kind_of(Array)
  end

  it '#delete' do
    @campaigns.each(&:delete)
    expect(@campaigns.size!).to eq(0)
  end

end