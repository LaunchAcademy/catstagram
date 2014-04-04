# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meow do
    association :user
    association :post
  end
end
