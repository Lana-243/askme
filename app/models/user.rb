class User < ApplicationRecord
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  NICKNAME_FORMAT = /\A[a-z_0-9]+\z/
  EMAIL_FORMAT = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  COLOR_FORMAT = /\A#\h{3}{1,2}\z/

  has_many :questions, dependent: :delete_all
  has_many :created_questions, class_name: "Question", foreign_key: "author_id"

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true,
            length: { maximum: 40 }, format: { with: NICKNAME_FORMAT }
  validates :email, presence: true, uniqueness: true,
            format: { with: EMAIL_FORMAT }
  validates :header_color, format: { with: COLOR_FORMAT }

  before_validation :downcase_nickname

  has_secure_password

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
