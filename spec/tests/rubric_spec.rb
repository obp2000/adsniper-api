require "spec_helper"

describe Mediasniper::Api::Models::Rubric do

  before(:all) do
    @rubrics = Mediasniper::Api::Models::Rubric.new(api_key: MainHelper.api_key)
  end

  it '#all' do
    expect(@rubrics.all).to be_a_kind_of(Hash)
  end

end