class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one_attached :image
  has_many :user_relations, foreign_key: "user_id", dependent: :destroy
  has_many :companies, through: :user_relations, dependent: :destroy
  has_many :company_relations, foreign_key: "user_id"
  has_many :companies, through: :company_relations
  has_many :rooms, dependent: :destroy, foreign_key: "user_id"
  has_many :messages, dependent: :destroy, foreign_key: "user_id"
  has_many :sns_credentials

  with_options presence: true do
    validates :nickname
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "はハイフン無し10桁もしくは11桁の半角数字で入力してください"}
    validates :detail
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'


  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
