class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[show create edit update destroy]
  def index
    @recruitments = Recruitment.order(id: :desc)
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end
end
