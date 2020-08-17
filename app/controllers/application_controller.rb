class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  case resource
  when Host
    top_host_path
  when 
    top_customers_path
  end
end
end
