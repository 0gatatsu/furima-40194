class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_many :comments
  has_one :order
  has_one_attached :image

  belongs_to_active_hash :genre
  belongs_to_active_hash :quality
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  validates :name, :image, :price, :content, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id, presence: true
  validates :price, numericality: { only_integer: true, less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300 }

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :genre_id
    validates :quality_id
    validates :payment_id
    validates :prefecture_id
    validates :days_id
  end
end