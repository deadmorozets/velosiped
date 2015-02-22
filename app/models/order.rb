class Order < ActiveRecord::Base
	has_many :operations
end
