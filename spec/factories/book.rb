FactoryBot.define do
  factory :book do
    title { Faker::String.random }

    trait :with_authors do
      after(:build) do |book|
        book.authors << FactoryBot.build(:author)
      end
    end
  end
end
