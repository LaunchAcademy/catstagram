# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    association :user

    image "Awesome Image"
    description "MyText"
  end
end
