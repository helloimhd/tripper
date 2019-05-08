class ExpensesController < ApplicationController

  def index
    @trip = Trip.find(params[:trip_id])
    @expenses = Expense.all.where(trip_id: @trip)
    @categories =Category.all
    @spend = @expenses.sum(:amount)
    @paid = @expenses.where(:spent => true).sum(:amount)
    @unpaid = @expenses.where(:spent => false).sum(:amount)

    #@test = Category.all.map{|category| category.expense}.sum(:amount)
    # byebug
     @column = @expenses.group(:category_id).sum(:amount)
     # p @column.keys
     # p @column.values
     @columnChart = {}
     @column.keys.each_with_index do |column, index|
      @categories.each do |category|
        if column === category.id
          # p category.name
          @columnChart[category.name] = @column.values[index]
        end
      end
     end
     # p @newObjs

  end

  def show
    @expenses = Expense.all
    @categories = Category.all
  end

  def new
    @expense = Expense.new
    @expense.spent = false
    @trips = Trip.all
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
    @expense = Expense.find(params[:id])

    @expense.destroy
    redirect_to trips_url
  end

  private
    def expense_params
      params.require(:expense).permit(:details, :amount, :trip_id, :spent, :category_id)
    end

end