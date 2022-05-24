class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true,
            length: {maximum: 40}, format: { with: /\A[a-z_0-9]+\z/ }
  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
