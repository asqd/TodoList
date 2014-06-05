require 'spec_helper'

describe "Viewing todo items" do
  let!(:todo_list) { Todolist.create!(title: "My todo list", description: "This is what I'm doing today") }

  before { visit root_path }

  it "display no items when todo list is empty" do
    within "#todo_list_#{todo_list.id}" do
      click_link "List Items"
    end

    expect(page).to have_content("TodoItems#index")
  end


end
