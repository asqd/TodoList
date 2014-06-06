require 'spec_helper'

describe "Completing todo items" do
  subject { page }

  let!(:todo_list) { FactoryGirl.create(:todolist) }
  let!(:todo_item) { FactoryGirl.create(:todo_item, todolist: todo_list) }

  it "successful when marking a single item complete" do
    expect(todo_item.completed_at).to be_nil
    visit_todo_list
    click_link "Mark Complete", dom_id_for(todo_item)
    todo_item.reload

    expect(todo_item.completed_at).to_not be_nil
  end

  describe "with completed items" do
    let!(:completed_todo_item) { FactoryGirl.create(:todo_item, content: "Go to the Shop", completed_at: 5.minutes.ago, todolist: todo_list) }
    before { visit_todo_list }

    it "shows completed items as completed" do
      within dom_id_for(completed_todo_item) do
        expect(page).to have_content(completed_todo_item.completed_at)
      end
    end

    it "shows completed items as completed" do
      within dom_id_for(completed_todo_item) do
        expect(page).to_not have_content("Mark Complete")
      end
    end
 
  end

end
