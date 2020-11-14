class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :quote_id }

  belongs_to :user
  belongs_to :quote
end
