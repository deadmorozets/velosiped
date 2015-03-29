require 'test_helper'

class OperationTest < ActiveSupport::TestCase
   test "should not save operation without title" do
     operation = FactoryGirl.build(:operation)
     operation.title = ''
     assert_not operation.save
   end

  test "should not save operation with negative cost" do
  	operation = FactoryGirl.build(:operation)
    operation.cost = -5.0
    assert_not operation.save
 	end

 	test "should not save operation with negative duration" do
  	operation = FactoryGirl.build(:operation)
    operation.duration = -0.5
    assert_not operation.save
 	end

   test "should save correct occupation" do
   	operation = FactoryGirl.build(:operation)
    assert operation.save
   end
end