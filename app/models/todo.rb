class Todo < ApplicationRecord
  validates :title, presence: true
  validates :completed, inclusion: {in: [true, false]}

  # Hack. See: https://github.com/hotwired/turbo-rails/issues/545
  broadcasts_refreshes_to ->(stream) { stream.class.broadcast_target_default }
end
