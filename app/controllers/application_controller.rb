class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
	end
end
