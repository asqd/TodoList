module TodoListHelpers

  include ApplicationHelper

  #Todo List functions
  def create_todo_list(options={})
    submit ||= "Create Todolist"
    options[:title] ||= "My todo list"
    options[:description] ||= "This is what I'm doing today"

    visit root_path
    click_link "New Todolist"
    expect(page).to have_content('New todolist')

    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button submit
  end

  def update_todo_list(options={})
    submit ||= "Update Todolist"
    options[:todo_list] ||= todo_list
    options[:title] ||= "Watch TV"
    options[:description] ||= "New TV Series"

    visit root_path
    click_link 'Edit', href: edit_todolist_path(options[:todo_list])

    fill_in 'Title', with: options[:title]
    fill_in 'Description', with: options[:description]
    click_button submit
  end

  #List Items functions
  def visit_todo_list(list={})
    list ||= todo_list
    visit root_path
    within "#todo_list_#{todo_list.id}" do
      click_link "List Items"
    end
  end

  def create_list_item(options={})
    submit ||= "Save"
    options[:todo_list] ||= todo_list
    options[:content] ||= "Milk"

    visit_todo_list
    click_link "New Todo Item"

    fill_in "Content", with: options[:content]
    click_button submit
  end

  def update_list_item(options={})
    submit ||= "Save"
    options[:todo_list] ||= todo_list
    options[:todo_item] ||= todo_item
    options[:content] ||= "Watch TV"

    click_link "Edit", href: edit_todolist_todo_item_path(options[:todo_list], options[:todo_item])
    fill_in "Content", with: options[:content]
    click_button submit
  end

end
