require 'spec_helper'

describe "Editing todo lists" do
  subject { page }

  let(:submit) { "Update Todolist" }
  let!(:todo_list) { FactoryGirl.create(:todolist) }

  describe "successfully update todo list" do
    before { update_todo_list }

    it { should have_content('successfully') }
    it { should have_content('Watch TV') }
  end

  describe "when title is empty" do
    before { update_todo_list title: "" }
    let!(:title) { todo_list.title }
    
    it "should save title" do
      todo_list.reload
      expect(todo_list.title).to eq(title)      
    end
    it { should have_content('error') }
  end

  describe "when title is too short" do
    before {  update_todo_list title: "a" }
    it { should have_content('error') }
  end

  describe "when description is too short" do
    before { update_todo_list description: "ab" }
    it { should have_content('error') }
  end
end
