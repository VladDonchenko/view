class UsersController < ApplicationController
after_action :rating
    def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  def profile
    @user = User.find(params[:id])
  end
  def save_profile
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  def rating
    arr = Order.where(implementer_id: @user).ids
    exc = []
    marks = []
    arr.each do |id|
      exc << Order.find(id).task.id
    end

    exc.each do |qqq|
      mark = Task.find(qqq).rating
      if mark > 0
        marks << mark
      end
    end

    if @user.role == 'implementer'
      if marks.size > 0
        @user.rating = marks.sum / marks.size
        @user.update(rating: @user.rating.to_i )
      else
        @user.update(rating: 0.0)
      end
  end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :description, :birthday, :rating)
  end
end
