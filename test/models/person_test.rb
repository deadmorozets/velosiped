require 'test_helper'

class PersonTest < ActiveSupport::TestCase
   test "should not save person without first_name and last_name" do
     person = Person.new
     assert_not person.save
   end

   test "should save correct person" do
   	person = FactoryGirl.build(:person)
    assert person.save
   end
end