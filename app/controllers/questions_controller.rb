class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide]

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: "New question has been created!"
    else
      flash.now[:alert] = "You have incorrectly filled in the form"

      render :new
    end
  end

  def update
    @question.update(question_params)

    redirect_to user_path(@question.user), notice: "Question has been saved"
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: "Question has been deleted"
  end

  def show

  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
