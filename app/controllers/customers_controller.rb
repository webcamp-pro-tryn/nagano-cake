class Hosts::CustomersController < ApplicationController
  def index
  	@customers = Customers.all
  end

  def show
  	@customer =Customers.find(params[:id])
  end

  def edit
  end
end
