class Task < ApplicationRecord
  belongs_to :category

  validates :title, presence: true, length: { minimum: 1}
  validates :details, length: { maximum: 250 }
end
