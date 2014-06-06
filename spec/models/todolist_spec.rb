require 'spec_helper'

describe Todolist do
  it { should have_many(:todo_items) }

  describe "has complete_items?" do
    let(:todo_list) { Todolist.create(title: "Todo list", description: "What I'm doing today") }

    it "returns true with completed todo list items" do
      todo_list.todo_items.create(content: "Go to the Shop", completed_at: 2.hour.ago)
      expect(todo_list.has_completed_items?).to be_true
    end

    it "returns true with no completed todo list items" do
      todo_list.todo_items.create(content: "Go to the Shop")
      expect(todo_list.has_completed_items?).to be_false
    end

    it "returns true with incompleted todo list items" do
      todo_list.todo_items.create(content: "Go to the Shop", completed_at: 2.hour.ago)
      expect(todo_list.has_incomplete_items?).to be_false
    end

    it "returns true with no incompleted todo list items" do
      todo_list.todo_items.create(content: "Go to the Shop")
      expect(todo_list.has_incomplete_items?).to be_true
    end



  end
end
