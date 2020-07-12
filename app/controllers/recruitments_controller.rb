class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[show edit update destroy]
  def index
    @recruitments = Recruitment.order(id: :desc)
  end

  def show
    # subscription = Recruitment.find(params[:id])
    # @name = subscription.users.first.name
    # @comment = subscription.participant_managements.first.comment
    @recruitments = Recruitment.order(id: :desc)
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_paramas)
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

  # def comment_new
  #   recruitment = Recruitment.new
  #   @recruitment = recruitment.participant_managements
  # end

  # def comment_create
  #   subscription = Recruitment.find(params[:id])
  #   pm = ParticipantManagement.new(subscription_params)
  #   pm.assign_attributes(user_id: current_user.id)
  #   subscription.participant_managements << pm
  #   if subscription.save!
  #     redirect_to recruitments_url
  #   else
  #     render :comment_new
  #   end
  # end

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

  # def subscription_params
  #   params.require(:participant_management).permit(
  #     :comment,
  #     :recruitment_id,
  #   )
  # end
end
