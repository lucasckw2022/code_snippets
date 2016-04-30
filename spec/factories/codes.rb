FactoryGirl.define do
  factory :code do
    association :kind, factory: :kind
    work Faker::Lorem.sentence
    title Faker::Name.name
    # no need to generate it by yourself, factory girl association would do it for you
    # kind_id {Kind.last}
  end
end
