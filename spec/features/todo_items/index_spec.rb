require 'spec_helper'

describe "Viewing todo items" do
  subject { page }
  
  let!(:todo_list) { FactoryGirl.create(:todolist) }
  let(:items_tag) { "ul.todo_items" }

  describe "when the todo list is empty" do
    before { visit_todo_list }
    it { should have_selector('h1', text: todo_list.title) }
    it { should_not have_selector("#{items_tag} li") }
  end

  describe "when list has items" do

    it "should have title list" do
      visit_todo_list
      page.should have_selector('h1', text: todo_list.title)
    end

    let(:items) { ["Milk", "Eggs", "Chocolate"] }

    it "should have item content" do
      items.each { |item| FactoryGirl.create(:todo_item, content: item, todolist: todo_list) }

      visit_todo_list
      expect(page).to have_selector(items_tag)
      expect(page.all("#{items_tag} li").size).to eq items.length
      items.each { |item| expect(page).to have_content(item)   }

    end

  end

end
