class OrdersController < ApplicationController
  
  before_action :find_order, only: [:edit, :update, :destroy]

  def index
  	@orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_param)
    if @order.save
      redirect_to edit_order_path(@order)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_param)
      redirect_to orders_path
    else 
      redirect_to :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_param
    params.require(:order).permit(:title, :start_date, :etc_date, :finish_date, :signed)
  end 

end
