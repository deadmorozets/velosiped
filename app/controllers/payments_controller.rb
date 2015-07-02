class PaymentsController < ApplicationController

	def index
		
		@payments_by_date = Payment.select("date(date) as payment_date, 
																				sum(amount) as total_amount").group("date(date)")

		@payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)
		if @payment.save
			redirect_to payments_path
		else
			redirect_to payments_path
		end
	end

	def payments_day
		@payments = Payment.where(date: params[:payment_date].to_date)
	end

	def operations_and_payments
		@person = Person.find(params[:person_id])
		@amount = params[:amount]
		@operations_and_payments = Operation.where(person_id: params[:person_id]).includes(:wages)
	end

	private

	def payment_params
		params.require(:payment).permit(:date, :amount, :person_id)
	end

end