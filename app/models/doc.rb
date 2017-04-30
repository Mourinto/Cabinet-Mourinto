class Doc < ApplicationRecord
  belongs_to :user
  scope :sorted, -> { order('created_at DESC') }
end
