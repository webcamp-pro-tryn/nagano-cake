class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

	def set_search
		@search = Item.ransack(params[:q])
		@items = @search.result
	end

	def after_sign_in_path_for(resource)
		case resource
		when Customer
			customers_items_path(current_customer)
		when Host
			host_top_path
		end
	end

	def after_sign_up_path_for(resource)
		customers_items_path(current_customer)
	end

	def after_sign_out_path_for(resource)
		homes_top_path
	end


	# def after_update_path_for(resource)
	# 	customers_path(current_customer)
	# end
	# def account_update(resource, params)
 #    	redirect to customers_path(current_customer)
 #  	end

	# def after_resetting_password_path_for(resource)
 #    	customers_path(current_customer)
 #    end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
	end

end
