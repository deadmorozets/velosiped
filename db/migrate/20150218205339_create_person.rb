class CreatePerson < ActiveRecord::Migration
  def change
    create_table :person do |t|
      t.belongs_to :orders
      t.string :first_name
      t.integer :post
      t.string :last_name

      t.timestamps
    end
  end
end
