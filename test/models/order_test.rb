require 'test_helper'

class OrderTest < ActiveSupport::TestCase
   test "should not save order without title and etc_date" do
     order = FactoryGirl.build(:order)
     order.title = ''
     order.etc_date = ''
     assert_not order.save
   end

   test "should save correct order" do
   	order = FactoryGirl.build(:order)
    assert order.save
   end
end