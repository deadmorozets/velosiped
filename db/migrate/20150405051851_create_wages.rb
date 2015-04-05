class CreateWages < ActiveRecord::Migration
  def change
    create_table :wages do |t|
      t.belongs_to :payment, index: true
      t.belongs_to :operation, index: true
      t.decimal :amount
    end
  end
end
