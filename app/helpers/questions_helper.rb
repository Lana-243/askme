module QuestionsHelper
  def render_with_hashtags(body)
    body.html_safe.gsub(Hashtag::HASHTAG_FORMAT) { |word| link_to word, hashtag_path(word.downcase.delete('#')) }
  end
end
