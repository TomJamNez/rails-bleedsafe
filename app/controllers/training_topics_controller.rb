class TrainingTopicsController < ApplicationController
  before_action :module_lookup, only: %i[new show create edit update]

  def show
    @training_topic = TrainingTopic.find(params[:id])
    @training_pages = @training_topic.training_pages.all
    @training_page = TrainingPage.new()
  end

  def new
    @training_topic = TrainingTopic.new()
  end

  def edit
    @training_topic = TrainingTopic.find(params[:id])
  end

  def create
    @training_topic = TrainingTopic.new(training_topic_params)
    @training_topic.training_module = @training_module
    @training_topic.active = true

      if @training_topic.save
        redirect_to training_module_path(@training_module)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @training_topic = TrainingTopic.find(params[:id])

    if @training_topic.update(training_topic_params)
      redirect_to training_module_training_topic_path(@training_topic), notice: "Training topic was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def training_topic_params
    params.require(:training_topic).permit(:name, :description, :active, :photo)
  end

  def module_lookup
  @training_module = TrainingModule.find(params[:training_module_id])
  end
end
