class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders

         validates :nickname, presence: true
         with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角ひらがな、全角カタカナ、漢字で入力して下さい" } do
         validates :last_name, presence: true
         validates :first_name, presence: true
         end
         with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" } do
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         end
         validates :birthday, presence: true
end
