class BudgetsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(budget_params)
      @user.update(budget_date: Date.tomorrow)
      flash[:success] = 'Budget has been successfully updated!'
      redirect_to expenses_path
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private 
  def budget_params
    params.require(:user).permit(:budget)
  end
end
