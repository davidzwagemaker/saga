class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?

   private

   def storable_location?
     request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
   end

   def store_user_location!
     store_location_for(:user, request.fullpath)
   end


  def after_sign_in_path_for(resource)
    if resource.guide
      my_tours_path
    else
      tours_path
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end


end
