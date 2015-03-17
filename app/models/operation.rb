class Operation < ActiveRecord::Base
	belongs_to :order
	has_one :person
end
