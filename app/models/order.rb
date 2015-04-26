class Order < ActiveRecord::Base
	
	has_many :operations, dependent: :destroy
	has_one :person
	validates :etc_date, presence: true, allow_blank: false
	validates :title, presence: true

	scope :current_orders, -> { where(finish_date: nil) }
	scope :finished_orders, -> { where.not(finish_date: nil) }

	def self.title_has_substr(substr)
		where("title ILIKE ?", "%#{substr}%")
	end

end
