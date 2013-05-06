require 'spec_helper'

describe "ng_words/new" do
  before(:each) do
    @current_account = assign(:account, stub_model(Account,
      :twitter_id => "rocky_manobi"
    ))
    assign(:ng_word, stub_model(NgWord,
      :account => nil,
      :word => "MyString"
    ).as_new_record)
  end

  it "renders new ng_word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ng_words_path, "post" do
      assert_select "input#ng_word_word[name=?]", "ng_word[word]"
    end
  end
end
