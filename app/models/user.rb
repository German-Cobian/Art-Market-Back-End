class User < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }
  validates :password, presence: true
end
