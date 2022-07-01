class User < ApplicationRecord
  has_secure_password

  COLOR_FORMAT = /\A#\h{3}{1,2}\z/


  before_validation :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true,
            length: {maximum: 40}, format: { with: /\A[a-z_0-9]+\z/ }
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :header_color, format: { with: COLOR_FORMAT }

  has_many :questions, dependent: :delete_all
  has_many :created_questions, class_name: "Question", foreign_key: "author_id"

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def downcase_nickname
    nickname&.downcase!
  end
end
