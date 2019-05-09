class TodosController < ApplicationController


	def index
	    @todos = ToDo.all
	    @categories =Category.all
      @trip = Trip.find(params[:trip_id])

	  end

	def show
		@todo = ToDo.find(params[:id])
		@categories = Category.all
	end

	def new
		@todo = ToDo.new
		@trips = Trip.all
    @trip = Trip.find(params[:trip_id])
		@categories = Category.all
	end

    def create
    @todo = ToDo.new(todo_params)

      if @todo.save
        redirect_to todos_path
      else
        puts "failed"
      end
  end


	def edit
	    @todo = ToDo.find(params[:id])
	    @categories = Category.all
	    @trips = Trip.all
      @trip = Trip.find(params[:trip_id])
	 end

	def update
    @trip = Trip.find(params[:trip_id])
    @todo = ToDo.find(params[:id])
	   @todo.update(todo_params)
	   redirect_to todos_path

  	end

  	def destroy
	    @todo = ToDo.find(params[:id])

	    @todo.destroy
	    redirect_to todos_path
    end

  private
	def todo_params
	params.require(:todo).permit(:details, :trip_id, :date, :category_id)
	end

end