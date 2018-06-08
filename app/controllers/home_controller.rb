class HomeController < ApplicationController

  def index
    @navbar = false
    if current_user != nil
      if current_user.guide
        redirect_to dashboard_index_path
      else
        redirect_to tours_path
      end
    end
  end
end