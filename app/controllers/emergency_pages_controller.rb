class EmergencyPagesController < ApplicationController
# TJ implemented rails-bleedsafe task 27, some issues and overlap with pundit and topics that cannot be delivered yet.
before_action :topic_lookup, only: %i[create update]
  def create

    @emergency_page = EmergencyPage.new(page_params)
    @emergency_page.emergency_topic = @emergency_topic
    #needs updating after pundit, should be false by default, making true now for testing and demo.
    @emergency_page.active = true
    @emergency_page.user = current_user

    if @emergency_page.save
      #sort redirect back to object instead of index, leaving like this as easier for people to learn what the app is doing. This is admin only so not important
      #we are already on this page, so full refresh is not appropriate, fix with time permitting
      redirect_to emergency_module_emergency_topic_path(@emergency_topic)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def update

    @emergency_page = EmergencyPage.find(params[:id])
    @emergency_page.user = current_user
    if @emergency_page.update(page_params)
       #we are already on this page, so full refresh is not appropriate, fix with time permitting
      redirect_to emergency_module_emergency_topic_path(@emergency_topic)
      else
      render :edit, status: :unprocessable_entity
    end

  end

  private
  def page_params
    params.require(:emergency_page).permit(:title, :step, :active, :photo)
  end

  def topic_lookup
    @emergency_topic = EmergencyTopic.find(params[:emergency_topic_id])
  end

  def module_lookup
  end

end
