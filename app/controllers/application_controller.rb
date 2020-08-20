class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		customers_items_path(current_customer)
	end

	def after_sign_up_path_for(resource)
		customers_items_path(current_customer)
	end

	def after_sign_out_path_for(resource)
		new_customer_session_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
	end
	def after_sign_in_path_for(resource)
  # case resource
  # when Host
  #   top_host_path
  # when 
  #   top_customers_path
  # end
end
end
