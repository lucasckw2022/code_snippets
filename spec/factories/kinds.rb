FactoryGirl.define do
  factory :kind do
    kind {Faker::Name.name}
  end
end
