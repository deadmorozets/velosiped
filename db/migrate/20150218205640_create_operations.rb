class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.belongs_to :person
      t.decimal :duration
      t.date :finish_date
      t.decimal :cost
      t.boolean :signed
      t.string :title

      t.timestamps
    end
  end
end
