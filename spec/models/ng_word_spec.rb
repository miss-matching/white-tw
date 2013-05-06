require 'spec_helper'

describe NgWord do
  @account = Account.new

  it "is not valid without a account_id" do
    ng_word = FactoryGirl.build(:ng_word_valid )
    ng_word.account = nil
    expect(ng_word).not_to be_valid
  end

  it "is not valid without a word" do
    ng_word = FactoryGirl.build(:ng_word_valid )
    ng_word.word = nil
    expect(ng_word).not_to be_valid
  end

  it "is not valid with word that has 140 length over" do
    ng_word = FactoryGirl.build(:ng_word_with_max_length)
    expect(ng_word).to be_valid
    ng_word.word << "1"
    expect(ng_word).not_to be_valid
  end

end
