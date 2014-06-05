require 'spec_helper'

describe "Editing todo items" do
  subject { page }

  let(:submit) { "Save" }
  let!(:todo_list) { FactoryGirl.create(:todolist) }
  let!(:todo_item) { FactoryGirl.create(:todo_item, todolist: todo_list) }

  describe "successfull update item" do
    before do
      visit_todo_list
      update_list_item(content: "Go to the Park")
    end

    it { should have_content("Saved todo list item.") }
    it { should have_content("Go to the Park") }
  end



  describe "unsuccessfull update item" do
    let!(:item_content) { todo_item.content }

    describe "when the item content blank" do
      before do
        visit_todo_list
        update_list_item(content: "")
      end

      it "should be save content" do
        todo_item.reload
        expect(todo_item.content).to eq(item_content)
      end

      it { should have_content('error') }
    end

    describe "when content is too short" do
      before do
        visit_todo_list
        update_list_item(content: "ab")
      end

      it "should be save content" do
        todo_item.reload
        expect(todo_item.content).to eq(item_content)
      end

      it { should have_content("Content is too short") } 
    end
  end

end
