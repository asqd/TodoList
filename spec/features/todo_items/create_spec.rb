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

  describe "with invalid content" do

    describe "when item has no content" do
      before { create_list_item(content: "") }

      it { should have_content("can't be blank") }
    end

    describe "when item has short content" do
      before { create_list_item(content: "ab") }

      it { should have_content("Content is too short") }
    end

  end

end
