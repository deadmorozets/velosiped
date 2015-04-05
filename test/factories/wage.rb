FactoryGirl.define do
  factory :wage do
    amount { Faker::Number.positive(0.00, 500.5) }
    association :operation
    association :payment
  end

end