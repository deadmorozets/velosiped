class OperationsController < ApplicationController
	before_action :find_order, except: [:in_hand, :finished]
	before_action :find_operation, only: [:edit, :update, :destroy, :additional, :split]

	def new
		@operation = Operation.new
	end

	def create
		@operation = @order.operations.new(operation_params)
		if @operation.save
			redirect_to edit_order_path(@order)
		else 
			redirect_to :new
		end
	end

	def edit
	end

	def update
		if @operation.update(operation_params)
			redirect_to edit_order_path(@order)
		else
			redirect_to :edit
		end
	end

	def destroy	
		@operation.destroy
		redirect_to edit_order_path(@order)
	end

	def in_hand
		@operations = Operation.where(finish_date: nil)
	end

	def additional
		@add_operation = @order.operations.new
		
		@add_operation.title = "Добавка " + @operation.title
		@add_operation.signed = false
		@add_operation.finish_date = @operation.finish_date
		@add_operation.person_id = @operation.person_id

		if @add_operation.save 
			redirect_to edit_order_operation_path(@order, @add_operation)
		end
	end

	def split
		@add_operation = @order.operations.new
		
		@add_operation.title = @operation.title
		@add_operation.signed = @operation.signed
		@add_operation.finish_date = @operation.finish_date
		unless @operation.cost.nil?
			@add_operation.cost = @operation.cost / 2
		end
		unless @operation.duration.nil?
			@add_operation.duration = @operation.duration / 2
		end

		if @add_operation.save 
			redirect_to edit_order_operation_path(@order, @add_operation)
		end
	end

	def finished
		@operation = Operation.find(params[:id])
		@operation.finish_date = Date.yesterday()
		if @operation.save
			redirect_to operations_in_hand_path
		end
	end

	private

	def find_order
		@order = Order.find(params[:order_id])
	end

	def find_operation
		@operation = @order.operations.find(params[:id])
	end

	def operation_params
		params.require(:operation).permit(:title, :signed, :cost, :finish_date, :duration, :person_id)
	end
end
