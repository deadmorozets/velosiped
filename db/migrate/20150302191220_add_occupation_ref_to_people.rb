class AddOccupationRefToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :occupation, index: true
  end
end
