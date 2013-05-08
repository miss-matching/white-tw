
require 'spec_helper'

describe "shared/_header.html.erb" do

  describe "when logged in" do

    before(:each) do
      @current_account = assign(:account, stub_model(Account,
        :twitter_id => "Twitter",
        :twitter_token => "Twitter Token",
        :twitter_secret => "Twitter Secret",
      ))
    end

    it "renders log out link" do
      render
      expect(rendered).to have_selector( "a", href: session_path, "data-method" => "delete"   )
    end

  end

  describe "when logged out" do

    before(:all) do
      @current_account = nil
    end

    it "should not render log out link" do
      render
      expect(rendered).not_to have_selector( "a", href: session_path, "data-method" => "delete"   )
    end

  end

end
