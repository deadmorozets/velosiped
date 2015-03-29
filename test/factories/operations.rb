FactoryGirl.define do
  factory :operation do
    duration { Faker::Number.positive(0.00, 100.5) }
    finish_date { rand(-10..10).days.from_now }
    cost { Faker::Number.positive(0.00, 20000.00) }
    signed { ["false", "true"].sample }
    title { Faker::Lorem.words(5).join(' ') }
    association :order
    association :person
  end

end