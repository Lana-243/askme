class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorise_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: "You have successfully registered"
    else
      flash.now[:alert] = "You have incorrectly filled in the form"

      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "Your data has been updated"
    else
      flash.now[:alert] = "Please check the data"

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'User has been destroyed'
  end

  def show
    @questions = @user.questions.order(created_at: :asc)
    @question = Question.new(user: @user)
  end

  private

  def authorise_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :header_color
    )
  end
end
