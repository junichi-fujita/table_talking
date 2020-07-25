class RecruitmentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_recruitment, only: %i[show edit update destroy]
  
  def index
    # @recruitments = Recruitment.order(id: :desc)
    @q = Recruitment.ransack(params[:q])
    @recruitments = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @recruitments = Recruitment.order(id: :desc)
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_paramas)
    @recruitment.assign_attributes(master_name: current_user.name)
    respond_to do |format|
      if @recruitment.save
        @recruitments = Recruitment.order(id: :desc)
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def edit

  end

  def update
    @recruitment.assign_attributes(recruitment_paramas)
    respond_to do |format|
      if @recruitment.save
        @recruitments = Recruitment.order(id: :desc)
        format.js
      else
        format.html
      end
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to @recruitment
  end

  private

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def recruitment_paramas
    params.require(:recruitment).permit(
      :title,
      :content,
      :appropriate_level,
      :master_name,
      :start_time,
      :play_time,
    )
  end
end
