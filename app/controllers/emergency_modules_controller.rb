class EmergencyModulesController < ApplicationController
  # TJ implemented rails-bleesafe task 25, some issues and overlap with pundit and topics that cannot be delivered yet.
  def index
    #user logic, will need work for admin as well
    @emergency_modules = EmergencyModule.where(active: true)
  end

  def show
    #user logic, will need work for admin as well
    @emergency_module = EmergencyModule.find(params[:id])

    @emergency_topics = @emergency_module.emergency_topics.all
  end

  def new
    @emergency_module = EmergencyModule.new()
  end

  def create
    @emergency_module = EmergencyModule.new(module_params)
    #needs updating after pundit, should be false by default, making true now for testing and demo.
    @emergency_module.active = true
    @emergency_module.user = current_user
    if @emergency_module.save
      #sort redirect back to object instead of index, leaving like this as easier for people to learn what the app is doing. This is admin only so not important
      redirect_to emergency_modules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @emergency_module = EmergencyModule.find(params[:id])
  end

  def update
    @emergency_module = EmergencyModule.find(params[:id])
    @emergency_module.user = current_user
    if @emergency_module.update(module_params)
      redirect_to emergency_module_path(@emergency_module)
      else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def module_params
    #needs updating after active storage
    params.require(:emergency_module).permit(:name, :active, :photo)
  end


end
