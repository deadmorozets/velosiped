class Operation < ActiveRecord::Base
	belongs_to :order
	belongs_to :person, inverse_of: :operations
	has_many :wages, inverse_of: :operation
	validates :duration, :cost, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
	validates :title, presence: true
end
