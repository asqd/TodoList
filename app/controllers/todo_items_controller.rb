class TodoItemsController < ApplicationController
  def index
    @todolist = Todolist.find(params[:todolist_id])
  end

  def new
    @todolist = Todolist.find(params[:todolist_id])
    @todo_item = @todolist.todo_items.new
  end

  def create
    @todolist = Todolist.find(params[:todolist_id])
    @todo_item = @todolist.todo_items.new(todo_item_params)
    if @todo_item.save
      flash[:success] = "Added todo list item."
      redirect_to todolist_todo_items_path
    else
    	flash[:error] = "There was a problem adding that todo list item"
    	render action: :new
    end
  end

  private

  def todo_item_params
    params[:todo_item].permit(:content)
  end

end
