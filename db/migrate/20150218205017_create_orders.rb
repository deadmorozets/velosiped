class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.has_many :operations
      t.date :etc_date
      t.date :finish_date
      t.boolean :signed
      t.date :start_date
      t.string :title

      t.timestamps
    end
  end
end
