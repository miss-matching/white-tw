# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    sequence(:twitter_id){ |n| "twitter_id#{n}" }
    twitter_token "token"
    twitter_secret "secret"
    last_login "2013-05-04 17:19:35"

    factory :account_with_two_ng_words do 
      after(:create) { |account| create_list(:ng_word, 2, account: account) }
    end
  end
end
