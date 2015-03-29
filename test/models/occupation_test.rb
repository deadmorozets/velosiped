require 'test_helper'

class OccupationTest < ActiveSupport::TestCase
   test "should not save occupation without name" do
     occupation = Occupation.new
     assert_not occupation.save
   end

   test "should save correct occupation" do
   	occupation = FactoryGirl.build(:occupation)
   	assert occupation.save
   end
end
