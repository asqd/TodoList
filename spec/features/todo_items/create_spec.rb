require 'spec_helper'

describe "Creating todo items" do
	subject { page }

	let(:submit) { "Save" } 
	let(:todo_list) { FactoryGirl.create(:todolist) } 

	describe "successfull with valid content" do
		before { create_list_item } 

		it { should have_content('Added todo list item') } 
		it { should have_selector('li', text: todo_list.todo_items.first.content) }   
	end
end