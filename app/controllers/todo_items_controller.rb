class TodoItemsController < ApplicationController
  def index
  	@todolist = Todolist.find(params[:todolist_id]) 
  end
end
