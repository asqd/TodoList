require 'spec_helper'

describe "Creating todo lists" do

  subject { page }

  let(:submit) { "Create Todolist" }

  def create_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is what I'm doing today"

    visit root_path
    click_link "New Todolist"
    expect(page).to have_content('New todolist')

    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button submit
  end



  describe "redirect to the index page on success" do
    before { create_todo_list }

    it { should have_content("My todo list") }
  end

  describe "with ivalid information" do
    before { visit newlist_path }
    
    it "should not create todo list" do
      expect{ click_button submit }.to_not change(Todolist, :count)
    end

    describe "when title is too short" do
      before { create_todo_list title: "a" }

      it { should have_content('error') }
    end

    describe "when description is too short" do
      before { create_todo_list description: "ab" }
      it { should have_content('error') }
    end

  end

end
