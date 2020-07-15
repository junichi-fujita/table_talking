class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.order(id: :desc)

  end
end
