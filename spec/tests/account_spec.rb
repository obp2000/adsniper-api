require "spec_helper"

describe Mediasniper::Api::Models::Account do

  before do
    @account = Mediasniper::Api::Models::Account.new(api_key: MainHelper.api_key)
  end

  it '#all' do
    #expect(@account.all).to be_a_kind_of(Array)
  end

  it '#read' do
    #expect(@account.read @account.first.id).to be_a_kind_of(@account.first.class)
  end

  it '#update' do
    random_skype = "random_skype_#{Random.rand(1...100)}"
    #@account.first.update(skype: random_skype)
    #expect(@account.first.read).to include(skype: random_skype)
  end

  it '#create' do

  end

  it '#delete' do

  end

end