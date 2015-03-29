class Occupation < ActiveRecord::Base
	has_one :person, inverse_of: :occupation
	validates :name, presence: true, uniqueness: true
end
