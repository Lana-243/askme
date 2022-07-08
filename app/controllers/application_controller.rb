class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: "You can't go there!"
  end

  def raise_404_error
    render file: 'public/404.html', layout: false, status: :not_found
  end
end
