require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :twitter_id => "MyString",
      :twitter_token => "MyString",
      :twitter_secret => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_twitter_id[name=?]", "account[twitter_id]"
      assert_select "input#account_twitter_token[name=?]", "account[twitter_token]"
      assert_select "input#account_twitter_secret[name=?]", "account[twitter_secret]"
    end
  end
end
