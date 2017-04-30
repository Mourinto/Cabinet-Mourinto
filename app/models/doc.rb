class Doc < ApplicationRecord
  scope :sorted, -> { order('created_at DESC') }
end
