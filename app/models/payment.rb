class Payment < ActiveRecord::Base
	belongs_to :person, inverse_of: :payments
	has_many :wages, inverse_of: :payment
	validates :amount, numericality: { greater_than_or_equal_to: 0 }, allow_blank: false
	validates :date, presence: true, allow_blank: false
end