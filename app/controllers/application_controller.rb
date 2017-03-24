class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
      if session[:user_type] == "Lender"
          Lender.find(session[:user_id]) if session[:user_id]
      elsif session[:user_type] == "Borrower"
          Borrower.find(session[:user_id]) if session[:user_id]
      end
  end

  def require_login
      if session[:user_id] == nil
          flash[:errors] = ["Please log in"]
          redirect_to "/"
      end
  end

 helper_method :current_user
end
