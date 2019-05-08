class TodosController < ApplicationController
	

	def index
	    @todos = ToDo.all
	  end

	def show
		@todo = ToDo.find(params[:id])
	end

	def new
		@todo = ToDo.new
		@trips = Trip.all
		@categories = Category.all
	end

	def create
		@todo = ToDo.new(todo_params)

	    if @todo.save
	    	redirect_to todo_path
	    else
	    	puts "failed"
	    end
	end

	def update
		@todo = ToDo.find(params[:id])
	    @todo.update(post_params)
	    redirect_to @todo

  	end

  	def destroy
	    @todo = ToDo.find(params[:id])
	    @todo.destroy
	    redirect_to todo_path
    end

  private
	def todo_params
	params.require(:todo).permit(:details, :trip_id, :date, :category_id)
	end

end
