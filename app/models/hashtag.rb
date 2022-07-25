class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :text, presence: true, length: { maximum: 280 }
end
