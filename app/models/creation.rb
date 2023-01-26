class Creation < ApplicationRecord
  has_many :purchases, dependent: :destroy
  has_one_attached :creation_pic

  validates :artist, presence: true
  validates :title, presence: true
  validates :type_of_work, presence: true
  validates :medium, presence: true
  validates :dimensions, presence: true
  validates :date_of_composition, presence: true
  validates :art_category, presence: true
  validates :country_of_origin, presence: true
  validates :price, presence: true

  def image_url
    Rails.application.routes.url_helpers.url_for(creation_pic) if creation_pic.attached?
  end
end
