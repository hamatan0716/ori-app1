class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: {maximum: 12 }
  validates :profile, length: { maximum: 200 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
  has_many :comments
  has_many :wants
  has_one_attached :avatar
  # 欲しいボタン
  def wanted_by?(item_id)
    wants.where(item_id: item_id).exists?
  end

end
