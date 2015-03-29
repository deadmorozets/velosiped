class Operation < ActiveRecord::Base
	belongs_to :order
	belongs_to :person, inverse_of: :operations
	validates :duration, :cost, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
	validates :title, presence: true
end
