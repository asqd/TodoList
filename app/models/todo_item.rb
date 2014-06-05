class TodoItem < ActiveRecord::Base
  belongs_to :todolist
  validates :content, presence: true, length: { minimum: 3 }
end
