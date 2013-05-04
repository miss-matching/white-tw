require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :twitter_id => "Twitter",
      :twitter_token => "Twitter Token",
      :twitter_secret => "Twitter Secret"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Twitter/)
    rendered.should match(/Twitter Token/)
    rendered.should match(/Twitter Secret/)
  end
end
