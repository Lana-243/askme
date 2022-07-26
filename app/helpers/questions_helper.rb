module QuestionsHelper
  def render_with_hashtags(body)
    body.gsub(/#[[:word:]-]+/) { |word| link_to word, hashtag_path(word.downcase.delete('#'))}.html_safe
  end
end
