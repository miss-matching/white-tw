require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :twitter_id => "MyString",
      :twitter_token => "MyString",
      :twitter_secret => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_twitter_id[name=?]", "account[twitter_id]"
      assert_select "input#account_twitter_token[name=?]", "account[twitter_token]"
      assert_select "input#account_twitter_secret[name=?]", "account[twitter_secret]"
    end
  end
end
