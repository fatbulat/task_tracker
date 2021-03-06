class UserController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User created'
      redirect_to @user
    else
      flash.now[:warning] = 'User did not create'
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
