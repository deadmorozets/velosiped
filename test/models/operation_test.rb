require 'test_helper'

class OperationTest < ActiveSupport::TestCase
   test "should not save operation without title" do
     operation = FactoryGirl.build(:operation)
     operation.title = ''
     assert_not operation.save
   end

   test "should save correct occupation" do
   	operation = FactoryGirl.build(:operation)
    assert operation.save
   end
end