class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:user_email])

    if user && user.authenticate(params[:user_password])
      log_in(user)
      redirect_to :gossips
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :gossips
  end
end
