class TodosController < ApplicationController


	def index
		@todo = ToDo.new
		@trips = Trip.all
	    @todos = ToDo.order(params[:sort])
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

  	def updateCompleted
  	    @trip = Trip.find(params[:trip_id])
    	@todo = ToDo.find(params[:id])


    if @todo.done == true
    	then @todo.done =false


    else @todo.done = true

    end
  	@todo.save
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