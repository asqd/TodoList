class Todolist < ActiveRecord::Base
  has_many :todo_items

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
end
