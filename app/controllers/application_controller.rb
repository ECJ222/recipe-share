class ApplicationController < ActionController::Base
    before_action :set_current_user, :require_user_logged_in

    private

    def set_current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      else 
        Current.user = nil
      end
    end

    def require_user_logged_in
      unless Current.user
        redirect_to :login
      end
    end
end
