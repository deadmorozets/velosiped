class Operation < ActiveRecord::Base
	belongs_to :order
	belongs_to :person, inverse_of: :operations
end
