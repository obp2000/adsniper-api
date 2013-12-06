require "spec_helper"

describe Mediasniper::Api::Models::Adcreative do

  before(:all) do
    @campaign = Mediasniper::Api::Models::Campaign.new(api_key: MainHelper.api_key).create MainHelper.load_fixture(:campaign)
    @adcreatives = Mediasniper::Api::Models::Adcreative.new(parent: @campaign)
    @adcreatives.each(&:delete)
    @first = @adcreatives.first
  end

  after(:all) do
    @adcreatives.each(&:delete)
    @campaign.delete
  end

  it '#create' do
    @adcreatives.create MainHelper.load_fixture(:adcreative)
    expect(@adcreatives.size!).to eq(1)
  end

  it '#read' do
    expect(@first.read.attributes).to include(name: 'adcreative_test')
  end

  it '#update' do
    @first.update name: 'update_test'
    expect(@first.read.attributes).to include(name: 'update_test')
  end

  it '#statistics' do
    expect(@first.statistics).to be_a_kind_of(Hash)
  end

  it '#all' do
    expect(@adcreatives.all).to be_a_kind_of(Array)
  end

  it '#delete' do
    @adcreatives.each(&:delete)
    expect(@adcreatives.size!).to eq(0)
  end

end