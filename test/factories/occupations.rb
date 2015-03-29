FactoryGirl.define do
  factory :occupation do
    name { Faker::Lorem.characters(rand(4..30)) }
  end

end
