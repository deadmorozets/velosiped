FactoryGirl.define do
  factory :person do
    first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		association :occupation
  end

end
