class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  NAME_REGEX_ZENKAKU = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  NAME_REGEX_KATAKANA = /\A[ァ-ヶーヴ－]+\z/

  validates :password, format: { with: PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname
    validates :first_name_kanji, format: { with: NAME_REGEX_ZENKAKU }
    validates :last_name_kanji, format: { with: NAME_REGEX_ZENKAKU }
    validates :first_name_kana, format: { with: NAME_REGEX_KATAKANA }
    validates :last_name_kana, format: { with: NAME_REGEX_KATAKANA }
    validates :birthday
  end
end
