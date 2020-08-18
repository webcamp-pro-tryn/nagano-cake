class Customers::CustomersController < ApplicationController

	def show
		@customer = Customer.find(params[:id])
		@cunstomer = current_customer
	end

	def edit
		@customer = Customer.find(params[:id])
		@cunstomer = current_customer
	end

	def update
	end

	def destroy
	end


end
