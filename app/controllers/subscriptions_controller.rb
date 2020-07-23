class SubscriptionsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_subscription, only: %i[edit update destroy accept reject]

  def new
    @recruitment = Recruitment.find(params[:recruitment_id])
    @subscription = ParticipantManagement.new
  end

  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    @subscription = @recruitment.participant_managements.new(subscription_params)
    @subscription.assign_attributes(user_id: current_user.id)
    respond_to do |format|
      if @subscription.save
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
    @subscription.assign_attributes(subscription_params)
    if @subscription.save
      redirect_to @recruitment, notice: "コメントを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @subscription.destroy
    redirect_to @recruitment, notice: "コメントを削除しました"
  end

  def accept
    @subscription.assign_attributes(acceptance: true)
    if @subscription.save!
      redirect_to @recruitment
    else
      render "recruitment/show"
    end
  end

  def reject
    @subscription.assign_attributes(acceptance: false)
    if @subscription.save!
      redirect_to @recruitment
    else
      render "recruitment/show"
    end
  end

  private

  def subscription_params
    params.require(:participant_management).permit(
      :comment,
      :recruitment_id,
    )
  end

  def set_subscription
    @recruitment = Recruitment.find(params[:recruitment_id])
    @subscription = @recruitment.participant_managements.find(params[:id])
  end
end
