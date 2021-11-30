class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_one_attached :image
  belongs_to :genre

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blanck" }
  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
  end
end
