class OrdersController < ApplicationController
  
  before_action :find_order, only: [:edit, :update, :destroy]

  def index
    if params[:orders_filter].nil? && session[:orders_filter].nil?
      params[:orders_filter] = '2'
    else
      params[:orders_filter] ||= session[:orders_filter]
    end
    session[:orders_filter] = params[:orders_filter]
    if params[:orders_filter] == '0'
      @orders = Order.current_orders
    elsif params[:orders_filter] == '1'
      @orders = Order.finished_orders
    elsif params[:orders_filter] == '2'
      @orders = Order.all
    end
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

  def search
    @orders = Order.title_has_substr(params[:query])
    render :index
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_param
    params.require(:order).permit(:title, :start_date, :etc_date, :finish_date, :signed)
  end 

end
