class HashtagsController < ApplicationController
  def create(params)
    @text = params[:text]
  end
end
