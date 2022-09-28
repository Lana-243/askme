class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]

  def new
    @user = User.find_by(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def create
    question_params = params.require(:question).permit(:body, :user_id)
    @question = Question.new(question_params)

    @question.author = current_user

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: 'New question has been created!'
    else
      flash.now[:alert] = 'You have incorrectly filled in the form'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer, :hashtag)

    @question.update(question_params)

    redirect_to user_path(@question.user), notice: 'Question has been saved'
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Question has been deleted'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.last(10).reverse
    @users = User.last(10).reverse
    @hashtags = Hashtag.with_questions.all
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end
end
