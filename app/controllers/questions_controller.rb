class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide hidden?]

  def create
    question = Question.create(question_params)

    redirect_to question_path(question), notice: "New question has been created!"
  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question), notice: "Question has been saved"
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: "Question has been deleted"
  end

  def show

  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to questions_path
  end

  def hidden?
    @question.hidden
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
