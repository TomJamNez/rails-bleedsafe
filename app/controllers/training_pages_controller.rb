class TrainingPagesController < ApplicationController


  before_action :set_training_page, only: [:create, :update]



  def create
    @training_page = TrainingPage.new(training_page_params)
    @training_page.training_topic = @training_topic
    @training_page.active = true

    if @training_page.save
      redirect_to training_module_training_training_topic_path(@training_module, @training_topic), notice: 'Training page was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @training_page.update(training_page_params)
      redirect_to training_module_training_emergency_topic_path(@training_module, @training_topic),
                  notice: 'Training page was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_training_page
    @training_topic = TrainingTopic.find(params[:training_topic_id])
    @training_module = TrainingModule.find(params[:training_module_id])
  end

  def training_page_params
    params.require(:training_page).permit(:title, :step, :active, :photo)
  end
  # Will use this later when pundit is ready
  # def authenticate_admin!
  #   redirect_to root_path unless current_user&.admin?
  # end
end
