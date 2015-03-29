FactoryGirl.define do
  factory :order do
    etc_date { rand(1..30).days.from_now }
    finish_date { rand(-10..-1).days.from_now }
    signed { ["false", "true"].sample }
    start_date { rand(1..10).days.ago }
    title { Faker::Lorem.words(5).join(' ') }
  end

end