class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :wants, dependent: :destroy
  has_one_attached :image
  belongs_to :genre

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blanck" }
  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
  end

  def self.search(search)
    if search != ""
      Item.where('introduction LIKE(?)', "%#{search}%")
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
