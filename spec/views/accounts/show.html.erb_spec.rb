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

  it "renders `delete tweets` button" do
    render
    expect(rendered).to have_selector("form",
      :action => account_tweets_path(:account_id => @account.id)
    ) do |form|
      expect(form).to have_selector("input", :type => "submit")
    end
  end
end
