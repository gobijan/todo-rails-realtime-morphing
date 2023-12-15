class Todo < ApplicationRecord
  validates :title, presence: true
  validates :completed, inclusion: {in: [true, false]}

  broadcasts_refreshes
end

