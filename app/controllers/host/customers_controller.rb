class Host::CustomersController < ApplicationController
  #before_action :authenticate_host!　ホストのみ機能を使える
  def index
  	@customers = Customer.page(params[:page])

  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(params_customer)
  		redirect_to host_customer_path(@customer)
  	else
  		render 'edit'
  	end
  end
  private
  def params_customer
  	params.require(:customer).permit(
  		:family_name,
  		:first_name,
  		:family_name_kana,
  		:first_name_kana,
  		:postal_code,
  		:address,
  		:phone_number,
  		:email
      )
  end
end
