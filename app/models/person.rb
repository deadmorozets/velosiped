class Person < ActiveRecord::Base
	belongs_to :occupation, inverse_of: :person
	has_many :operations, inverse_of: :person
end
