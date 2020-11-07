class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :user_relations, foreign_key: "company_id"
  has_many :users, through: :user_relations
  has_many :company_relations, foreign_key: "company_id", dependent: :destroy
  has_many :users, through: :company_relations, dependent: :destroy
  has_many :rooms, dependent: :destroy, foreign_key: "company_id"
  has_many :company_messages, dependent: :destroy, foreign_key: "company_id"

  with_options presence: true do
    validates :company_name
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "はハイフン無し10桁もしくは11桁の半角数字で入力してください"}
    validates :office_url, format: {with: /\A#{URI::regexp(%w(http https))}\z/, message: "は正しく入力してください"}
    validates :detail
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' } do
    validates :staff_lastname_kana
    validates :staff_firstname_kana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
