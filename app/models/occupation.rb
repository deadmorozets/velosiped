class Occupation < ActiveRecord::Base
	has_one :person, inverse_of: :occupation
end
