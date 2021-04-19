FactoryBot.define do
  factory :book do
    name {Faker::Book.title}
    author {Faker::Artist.name}
    synopsis {Faker::Lorem.sentence[0..100]}
    association :category, factory: :category
    association :created_by, factory: :user
  end
end