class Order < ActiveRecord::Base
	has_many :operations, dependent: :destroy
	has_one :person
end
