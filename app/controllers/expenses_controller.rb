class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.all
    @trip = Trip.find(params[:trip_id])
    @expenses = Expense.all.where(trip_id: @trip)
    @categories =Category.all
    @spend = @expenses.sum(:amount)
    @paid = @expenses.where(:spent => true).sum(:amount)
    @unpaid = @expenses.where(:spent => false).sum(:amount)
    @budget = @trip.budget
    #@test = Category.all.map{|category| category.expense}.sum(:amount)
     @column = @expenses.group(:category_id).sum(:amount)
     @columnChart = {}
     @column.keys.each_with_index do |column, index|
      @categories.each do |category|
        if column === category.id
          @columnChart[category.name] = @column.values[index]
        end
      end
     end

  end

  def index2
    @trips = Trip.all
    @trip = Trip.find(params[:trip_id])
    @expenses = Expense.all.where(trip_id: @trip)
    @categories =Category.all
  end


  def show
    @expenses = Expense.all
    @categories = Category.all
  end

  def new
    @expense = Expense.new
    @expense.spent = false
    #@trips = Trip.all
    @trip = Trip.find(params[:trip_id])
    @categories = Category.all
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.find(params[:id])
    @categories = Category.all
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
        redirect_to expenses_url
    else
      render 'new'
    end
  end

  def update
    @expense = Expense.find(params[:id])

    @expense.update(expense_params)
    redirect_to "/trips/#{@expense.trip_id}/expenses/details"
  end

  def paidTick
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.find(params[:id])

    if @expense.spent == false
      then @expense.spent = true
    else @expense.done = false
    end
    @expense.save
    redirect_to expenses_details_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    redirect_to "/trips/#{@expense.trip_id}/expenses/details"
  end

  private
    def expense_params
      params.require(:expense).permit(:details, :amount, :trip_id, :spent, :category_id,)
    end

end