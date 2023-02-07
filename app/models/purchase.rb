class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :creation

  # validates :sale, presence: true
  validates :quantity, presence: true
end
