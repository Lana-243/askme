class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true

  def downcase_nickname
    nickname.downcase!
  end
end
