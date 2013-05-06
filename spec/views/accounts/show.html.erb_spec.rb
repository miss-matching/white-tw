#coding: utf-8
require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :twitter_id => "Twitter",
      :twitter_token => "Twitter Token",
      :twitter_secret => "Twitter Secret",
    ))
    @account.ng_words = [
      assign(:ng_word, stub_model(NgWord, :word => "死んでしまえ"))
    ]

  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Twitter/)
  end
  it "renders ng_words attributes and linke to basic CURD"  do
    render
    @account.ng_words.each do |ng_word|
      expect(rendered).to match(/死んでしまえ/)
      expect(rendered).to have_selector( "a", href: new_ng_word_path )
      expect(rendered).to have_selector( "a", href: edit_ng_word_path( ng_word ) )
      expect(rendered).to have_selector( "a", href: ng_word_path( ng_word ), "data-method" => "delete"   )
    end
  end

end
