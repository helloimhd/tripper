class ExpensesController < ApplicationController

  def index
    @trip = Trip.find(params[:id])
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
    @categories = Category.all
  end

  def new
    @expense = Expense.new
    @expense.spent = false
    @trips = Trip.all
    @categories = Category.all
  end

  def edit
    @expense = Expense.find(params[:id])
    @categories = Category.all
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
        redirect_to trips_url
    else
      render 'new'
    end
  end

  def update
    @expense.update(expense_params)
    redirect_to @expense
  end

  def destroy
    @expense.destroy
    redirect_to trips_url
  end

  private
    def expense_params
      params.require(:expense).permit(:details, :amount, :trip_id, :spent, :category_id)
    end

end