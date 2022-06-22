class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :category, presence: true, :uniqueness => {:scope => :user_id}
end
