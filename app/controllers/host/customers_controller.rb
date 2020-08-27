class Host::CustomersController < ApplicationController
  before_action :authenticate_host!
  def index
    @customers = Customer.page(params[:page])
    @q = Customer.ransack(params[:q])
    if !params[:q].nil?
      @customers = @q.result.page(params[:page])
    else
      @@customers = Customer.page(params[:page])
    end
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
      flash[:success] = "会員情報が更新されました"
      redirect_to host_customer_path(@customer)
    else
      flash[:danger] = "会員情報の更新に失敗しました"
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
      :email,
      :is_deleted
    )
  end
end
