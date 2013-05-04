# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    twitter_id "MyString"
    twitter_token "MyString"
    twitter_secret "MyString"
    last_login "2013-05-04 17:19:35"
  end
end
