class Customers::CustomersController < ApplicationController

	def show
		@customer = Customer.find(params[:id])
		@customer = current_customer
	end

	def withdraw
		@customer = Customer.find(params[:id])
		@customer.update(is_deleted: true)
		reset_session
		redirect_to new_customer_registration_path
	end

	def withdraw_confirm
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		customer = Customer.find(params[:id])
		customer.update(customer_params)
		redirect_to customers_path(customer.id)
	end

	private

	def customer_params
		params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
	end
end
