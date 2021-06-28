class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders

         validates :nickname, presence: true
         with_options presence: true do
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角ひらがな、全角カタカナ、漢字で入力して下さい" }
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角ひらがな、全角カタカナ、漢字で入力して下さい" }
         end
         with_options presence: true do
         validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
         end
         validates :birthday, presence: true
end
