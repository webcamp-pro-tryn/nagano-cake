class Customers::DeliveriesController < ApplicationController
  
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
    # @delivery_new = current_customer.delivery
    # # @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
       redirect_to customer_deliveries_path(current_customer)
    else
       render :index
     end
  end


  def edit
    @delivery = Delivery.find(params[:id])
    @delivery.customer_id = current_customer.id
  end

  def update
    delivery = Delivery.find(params[:id])
    if delivery.update(delivery_params)
       redirect_to customer_deliveries_path(current_customer)
     else
       render :edit
     end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to customer_deliveries_path(current_customer)
  end

  private
   def delivery_params
     params.require(:delivery).permit(:postal_code, :address, :name)
   end

   def customer_params
     params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
   end
end

