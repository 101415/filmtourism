class Tweet < ApplicationRecord
  validates :text, presence: true
  validates :place, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :images, dependent: :destroy
  

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
   mount_uploader :image, ImageUploader
end