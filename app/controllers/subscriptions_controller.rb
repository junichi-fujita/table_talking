class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[edit]

  def new
    recruitment = Recruitment.new
    @recruitment = recruitment.participant_managements
  end

  def create
    subscription = Recruitment.find(params[:recruitment_id])
    @pm = ParticipantManagement.new(subscription_params)
    @pm.assign_attributes(user_id: current_user.id)
    subscription.participant_managements << @pm
    if subscription.save!
      redirect_to recruitments_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    
  end

  private

  def subscription_params
    params.require(:participant_management).permit(
      :comment,
      :recruitment_id,
    )
  end

  def set_subscription
    recruitment = Recruitment.find(params[:recruitment_id])
    @recruitment = recruitment.participant_managements.find(params[:id])
  end
end
