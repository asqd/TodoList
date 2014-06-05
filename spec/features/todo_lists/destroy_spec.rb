require 'spec_helper'

describe "Deleting todo lists" do
  
  let!(:todo_list) { FactoryGirl.create(:todolist) }

  describe "successfully destroy todo list" do
    before { visit root_path }

    it "should delete todo list" do
      expect{ click_link "Destroy", href: todolist_path(todo_list) }.to  change(Todolist, :count).by(-1)
      expect(page).to_not  have_content(todo_list.title)
    end

  end
end
