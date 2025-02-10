class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    current_user.expenses.where(created_at: (Date.today.prev_month.beginning_of_month..Date.today.prev_month.end_of_month)).destroy_all

    @expenses = current_user.expenses.where(created_at: (Date.today.beginning_of_month..Date.today.end_of_month)).order(created_at: :desc)
    @total_expenses = current_user.expenses.sum(:amount)
  end

  def new 
    @expense = Expense.new 
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:success] = 'Expense has been successfully created!'
      redirect_to expenses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])

    if @expense.update(expense_params)
      flash[:success] = 'Expense has been successfully updated!'
      redirect_to expenses_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    if @expense
      @expense.destroy
      flash[:success] = 'Expense has been successfully deleted!'
      redirect_to expenses_path
    else
      render :show, status: :unprocessable_entity
    end
  end 

  private 
  def expense_params
    params.require(:expense).permit(:amount, :notes, :category, )
  end
end
