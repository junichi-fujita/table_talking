class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[show edit update destroy]
  def index
    @recruitments = Recruitment.order(id: :desc)
  end

  def show
    @participants = current_user
    @pm = ParticipantManagement.new
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @participants = current_user
    @pm = ParticipantManagement.new
    @recruitment = Recruitment.new(recruitment_paramas)
    # master_nameをcurrent_userに変更する予定
    @recruitment.assign_attributes(master_name: current_user.name)
    if @recruitment.save!
      redirect_to @recruitment, notice: "募集内容を登録しました。"
    else
      render :new
    end
  end

  def edit

  end

  def update
    @recruitment.assign_attributes(recruitment_paramas)
    if @recruitment.save!
      redirect_to @recruitment, notice: "募集内容を編集しました。"
    else
      render :new
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to :recruitments, notice: "募集内容を削除しました。"
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
