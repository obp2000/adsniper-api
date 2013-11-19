require "spec_helper"

describe Adsniper::Api::Models::SubAccount do

  ###
  # Sub Account - it is an account, so he has his own api-key.
  # Accordingly, all of the functions available subaccounts account
  ###

  #TODO

  before(:all) do
    @account = Adsniper::Api::Models::Account.new(api_key: MainHelper.api_key).first
    @sub_accounts = @account.sub_accounts
  end

  after(:all) do
    @sub_accounts.all.each do |sub|
      @sub_accounts.delete sub.id
    end
  end

  it '#all' do
    expect(@sub_accounts.all).to be_a_kind_of(Array)
  end

  it '#read' do
    #expect(@sub_accounts.first).to be_a_kind_of(Adsniper::Api::Models::Account)
    #expect(@sub_accounts.read(@sub_accounts.first.id).attributes).to include(:login)
  end

  it '#update' do
    #@sub_accounts.update @sub_accounts.first.id, skype: 'skype'
    #expect(@sub_accounts.read(@sub_accounts.first.id).attributes).to include(skype: 'skype')
  end

  it '#create' do
    #expect(@sub_accounts.read(@created.id).attributes).to include(login: 'testtest@nectarin.ru')
  end

  it '#delete' do
    #@sub_accounts.delete @created.id
    #expect(@sub_accounts.read(@created.id).attributes).to include(login: 'testtest@nectarin.ru')
  end

end