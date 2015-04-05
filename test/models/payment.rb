require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
   test "should not save payment without date" do
     payment = FactoryGirl.build(:payment)
     payment.date = ''
     assert_not payment.save
   end

  test "should not save payment with negative amount" do
  	payment = FactoryGirl.build(:payment)
    payment.amount = -100.0
    assert_not payment.save
 	end

   test "should save correct payment" do
   	payment = FactoryGirl.build(:payment)
    assert payment.save
   end
end