class ApplicationController < ActionController::Base
  include SessionsHelper
  include GossipsHelper

  private

  def authenticate_user
    unless logged_in?
      flash[:error] = "Please log in"
      redirect_to new_session_path
    end
  end
end
