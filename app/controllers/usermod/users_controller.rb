class Usermod::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to dashboard_path
  end

  def show
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
  end

  def edit
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
  end

  def update
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?

    @user.update(user_params)

    if @user.valid?
      redirect_to root_path
    else 
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    return render_not_found if @user.blank?
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname)
  end

  def render_not_found
    render plain: 'Not Found :(', status: :not_found
  end
end
