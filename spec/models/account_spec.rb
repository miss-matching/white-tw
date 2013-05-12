require 'spec_helper'

describe Account do

  describe "ng_words" do
    it "returns all ng_words belong to the account" do
      account = FactoryGirl.create(:account_with_two_ng_words)
      another_account = FactoryGirl.create(:account_with_two_ng_words)
      expect(account.ng_words).to have(2).items
    end
  end

  describe "destroy" do
    it "deletes own ng_words" do
      account = FactoryGirl.create(:account_with_two_ng_words)
      expect{
        account.destroy
      }.to change(NgWord,:count).by(-2)
    end
  end

end
