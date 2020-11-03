class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :companies, through: :user_relations, dependent: :destroy
  has_many :user_relations, dependent: :destroy
  has_many :companies, through: :company_relations
  has_many :company_relations

  with_options presence: true do
    validates :nickname
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "はハイフン無し10桁もしくは11桁の半角数字で入力してください"}
    validates :detail
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
