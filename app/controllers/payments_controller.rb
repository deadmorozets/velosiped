class PaymentsController < ApplicationController
	before_action :find_payment, only: [:operations_and_payments, :add_wage]
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
		@payments = Payment.where(date: params[:payment_date].to_date).includes(:person)
	end

	def operations_and_payments
		@person = Person.find(@payment.person_id)
		@operations_and_payments = Operation.select("operations.id as operations_id,
																									operations.person_id as person_id, 
																									operations.finish_date as finish_date,
																									operations.cost as cost,
																									operations.title as title,
																									sum(wages.amount) as wage_sum,
																									operations.order_id as order_id")
																				.joins('LEFT OUTER JOIN wages ON wages.operation_id = operations.id')
																				.group("operations.id")
																				.where(person_id: @payment.person_id)
																				.order('operations.finish_date')
																				.joins('INNER JOIN orders ON orders.id = operations.order_id')

	end

	def add_wage
		if @amount <= 0 
			redirect_to operations_and_payments_path
		end
		@operation = Operation.find(params[:operation_id])
		if @operation.cost >= @amount 
			@wage = Wage.create(payment_id: params[:payment_id], 
													operation_id: params[:operation_id],
													amount: @amount)
		else
			@wage = Wage.create(payment_id: params[:payment_id], 
													operation_id: params[:operation_id],
													amount: @operation.cost)
		end
		redirect_to operations_and_payments_path
	end

	private

	def payment_params
		params.require(:payment).permit(:date, :amount, :person_id)
	end

	def find_payment
		@payment = Payment.find(params[:payment_id])
		@amount = @payment.amount - Wage.where(payment_id: @payment.id).sum('amount')
	end

end