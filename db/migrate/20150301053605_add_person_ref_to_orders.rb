class AddPersonRefToOrders < ActiveRecord::Migration
  def change
  	add_reference :orders, :person, index: true
  end
end
