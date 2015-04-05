require 'test_helper'

class WageTest < ActiveSupport::TestCase

  test "should not save wage with negative amount" do
  	wage = FactoryGirl.build(:wage)
    wage.amount = -100.0
    assert_not wage.save
 	end

   test "should save correct wage" do
   	wage = FactoryGirl.build(:wage)
    assert wage.save
   end
end