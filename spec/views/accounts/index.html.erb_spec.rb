require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :twitter_id => "Twitter",
        :twitter_token => "Twitter Token",
        :twitter_secret => "Twitter Secret"
      ),
      stub_model(Account,
        :twitter_id => "Twitter",
        :twitter_token => "Twitter Token",
        :twitter_secret => "Twitter Secret"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter Token".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter Secret".to_s, :count => 2
  end
end
