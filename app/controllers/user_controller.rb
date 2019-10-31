class UserController < ApplicationController
  def new

  end

  def create
    if City.where(name: params[:user_city], zip_code: params[:user_zip_code]).exists?
      @city = City.where(name: params[:user_city], zip_code: params[:user_zip_code]).first
    else
      @city = City.create(name: params[:user_city], zip_code: params[:user_zip_code])
    end

    @user = User.new(
      first_name: params[:user_first_name],
      last_name: params[:user_last_name],
      age: params[:user_age],
      city: @city,
      email: params[:user_email],
      password: params[:user_password],
      password_confirmation: params[:password_confirmation],
      description: params[:description]
    )

    if @user.save
      flash.now[:success] = "Votre compte a bien été enregistré, bienvenue sur The Gossip Project"
      redirect_to :gossips
    else
      flash.now[:error] = "Entrées incorrect, veuillez recommencer"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
