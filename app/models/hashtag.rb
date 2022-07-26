class Hashtag < ApplicationRecord
  has_and_belongs_to_many :questions

  validates :text, presence: true, length: { maximum: 280 }

  scope :with_questions, -> { where_exists(:questions) }
end
