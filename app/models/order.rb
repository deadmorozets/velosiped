class Order < ActiveRecord::Base
	has_many :operations, dependent: :destroy
	has_one :person
	validates :etc_date, presence: true, allow_blank: false
	validates :title, presence: true
end
