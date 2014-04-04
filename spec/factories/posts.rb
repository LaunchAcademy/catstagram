FactoryGirl.define do
  factory :post do
    association :user

    # You can use the same fixture file that you added earlier
    image File.open(File.join(Rails.root, '/spec/fixtures/sleeping_cat.jpeg'))

    trait :with_description do
      # We use sequence to make sure that each post has a unique description.
      # This makes it easier to test whether or not each post is present on the
      # page.
      sequence(:description) { |n| "Meet kitty#{n}. MEOWWW!" }
    end
  end
end
