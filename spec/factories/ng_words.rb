# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ng_word do
    account nil
    sequence(:word) { |n| "ngword#{n}" }
  end

  factory :ng_word_valid, :class => NgWord do
    account_id 1
    sequence(:word) { |n| "ngword#{n}" }
  end

  factory :ng_word_with_max_length ,:parent => :ng_word_valid do
    word "00000000001111111111222222222233333333334444444444555555555566666666667777777777999999999900000000001111111111222222222233333333334444444444"
  end
end
