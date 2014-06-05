FactoryGirl.define do
  factory :todolist do
  	title "Todo list"
  	description "What I'm doing today"
  end

  factory :todo_item do
  	content "Watch TV"
  	todolist
  end
end
