class HashtagsController < ApplicationController
  def create(params)
    @text = params[:text]
  end

  def show
    @hashtag = Hashtag.with_questions.find_by(text: params[:text])
    @questions = @hashtag.questions
  end
end
