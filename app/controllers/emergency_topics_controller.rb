class EmergencyTopicsController < ApplicationController
 # TJ implemented rails-bleedsafe task 26, some issues and overlap with pundit and topics that cannot be delivered yet.
  before_action :module_lookup, only: %i[new show create edit update]
  def show
#user logic, will need work for admin as well
    @emergency_topic = EmergencyTopic.find(params[:id])
    @emergency_pages = @emergency_topic.emergency_pages.all
#this is an admin only variable, amend after pundit
    @emergency_page = EmergencyPage.new()

  end

  def new
    @emergency_topic = EmergencyTopic.new()
  end

  def create
    @emergency_topic = EmergencyTopic.new(topic_params)
    @emergency_topic.emergency_module = @emergency_module
    #needs updating after pundit, should be false by default, making true now for testing and demo.
    @emergency_topic.active = true
    @emergency_topic.user = current_user

    if @emergency_topic.save
      #sort redirect back to object instead of index, leaving like this as easier for people to learn what the app is doing. This is admin only so not important
      redirect_to emergency_module_path(@emergency_module)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @emergency_topic = EmergencyTopic.find(params[:id])
  end

 def update
    @emergency_topic = EmergencyTopic.find(params[:id])
    @emergency_topic.user = current_user
    if @emergency_topic.update(topic_params)
      redirect_to emergency_module_emergency_topic_path(@emergency_topic)
      else
      render :edit, status: :unprocessable_entity
    end
  end



 private
  def topic_params
    #needs updating after active storage
    params.require(:emergency_topic).permit(:name, :description, :active, :photo, :emergency_module_id)
  end

  def module_lookup
     @emergency_module = EmergencyModule.find(params[:emergency_module_id])
  end
end
