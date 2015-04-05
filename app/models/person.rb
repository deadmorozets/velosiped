class Person < ActiveRecord::Base
	belongs_to :occupation, inverse_of: :person
	has_many :operations, inverse_of: :person
	has_many :payments, inverse_of: :person
	validates :first_name, :last_name, presence: true, allow_blank: false
end
