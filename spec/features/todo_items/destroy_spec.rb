require 'spec_helper'

describe "Deleting todo items" do
  subject { page }

  let(:submit) { "Delete" }
  let!(:todo_list) { FactoryGirl.create(:todolist) }
  let!(:todo_item) { FactoryGirl.create(:todo_item, todolist: todo_list) }


  describe "successfull update item" do
    before { visit_todo_list }

    it "should delete item" do
    	expect{ click_link "Delete", href: todolist_todo_item_path(todo_list, todo_item) }.to change(TodoItem, :count).by(-1)  
    end
  end
end
