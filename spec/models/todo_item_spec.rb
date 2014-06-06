require 'spec_helper'

describe TodoItem do
  it { should belong_to(:todolist) }

  describe "completed?" do
    let(:todo_item) { TodoItem.create(content: "Meow!" ) }


    it "is false when completed_at is nil" do
      todo_item.completed_at = nil
      expect(todo_item.completed?).to be_false
    end


    it "is ture when completed_at is not empty" do
      todo_item.completed_at = Time.now
      expect(todo_item.completed?).to be_true
    end

  end
end
