class AddOrderToOperation < ActiveRecord::Migration
  def change
    add_reference :operations, :order, index: true
  end
end
