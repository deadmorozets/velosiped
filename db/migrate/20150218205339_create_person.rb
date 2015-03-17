class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.belongs_to :order
      t.belongs_to :operation
      t.string :first_name
      t.integer :post
      t.string :last_name

      t.timestamps
    end
  end
end
