class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.budget_date.month != Date.today.month
        redirect_to edit_budget_path(@user)
      else
        redirect_to expenses_path
      end
    else
      flash[:error] = 'Username and password do not match.'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end 
  
end
