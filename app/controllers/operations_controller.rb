class OperationsController < ApplicationController
	before_action :find_order
	before_action :find_operation, only: [:edit, :update, :destroy]

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

	private

	def find_order
		@order = Order.find(params[:order_id])
	end

	def find_operation
		@operation = @order.operations.find(params[:id])
	end

	def operation_params
		params.require(:operation).permit(:title, :signed, :cost, :finish_date, :duration)
	end
end
