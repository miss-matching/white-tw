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

  describe "assign_twitter_info" do
    before do
      # mock the twitter
      @mocked_twitter_user = Twitter::User.new(id: '12345')
      @mocked_twitter_user.stub(:profile_image_url).and_return('http://image.png')
      @mocked_twitter_user.stub(:screen_name).and_return('screenname')
      Twitter::Client.any_instance.stub(:user).and_return(@mocked_twitter_user)
    end


    it "assign attributes by request.env from twitter oauth" do
      # given
      twitter_auth_info ={
        'uid' => '12345', 
        'credentials' => { 'secret' => 'secret', 'token' => 'token' },
      }
      # when
      account = Account.new
      account.assign_twitter_info( twitter_auth_info )
      # then
      expect( account.twitter_id ).to eq('12345')
      expect( account.twitter_secret ).to eq('secret')
      expect( account.twitter_token ).to eq('token')
      expect( account.twitter_image_url ).to eq('http://image.png')
      expect( account.twitter_screen_name ).to eq('screenname')
    end
  end



end
