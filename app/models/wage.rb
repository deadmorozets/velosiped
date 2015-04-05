class Wage < ActiveRecord::Base
	belongs_to :payment, inverse_of: :wages
	belongs_to :operation, inverse_of: :wages
	validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_blank: false
end