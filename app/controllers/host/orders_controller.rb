class Host::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find[:id]
  end

  def edit
  end
end
