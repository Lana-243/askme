class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true
  has_and_belongs_to_many :hashtags, dependent: :destroy

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :create_hashtags

  def create_hashtags
    self.hashtags =
      get_question_hashtags.map { |hashtag| Hashtag.create_or_find_by(text: hashtag.delete('#')) }
  end

  private

  def get_question_hashtags
    full_text = "#{body} #{answer}"
    has_hashtags(full_text.downcase).uniq
  end

  def has_hashtags(text)
    text.scan(/#[[:word:]-]+/)
  end
end
