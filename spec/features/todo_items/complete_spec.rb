require 'spec_helper'

describe "Completing todo items" do
	let!(:todo_list) { FactoryGirl.create(:todolist) } 
	let!(:todo_item) { FactoryGirl.create(:todo_item, todolist: todo_list) } 

	it "successful when marking a single item complete" do
		expect(todo_item.completed_at).to be_nil
		visit_todo_list
		click_link "Mark Complete", dom_id_for(todo_item)
		todo_item.reload
		
		expect(todo_item.completed_at).to_not be_nil  
	end
end