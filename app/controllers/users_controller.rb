class UsersController < ApplicationController
  before_action :authenticate_user! 
  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.order(id: :desc)

  end
end
