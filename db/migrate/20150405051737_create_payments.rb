class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :person
      t.date :date
      t.decimal :amount
    end
  end
end
