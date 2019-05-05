class ExpensesController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @expenses = Expense.all.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @expense = Expense.new
    @trips = Trip.all
    @categories = Category.all
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)

    @expense.save
    redirect_to @expense

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
      params.require(:expense).permit(:detail, :amount, :trip_id, :spent)
    end

end