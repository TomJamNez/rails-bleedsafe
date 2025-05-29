  class TrainingModulesController < ApplicationController
    def index
      @training_modules = TrainingModule.all
    end

    def show
      @training_module = TrainingModule.find(params[:id])
      @topics = @training_module.topics.all
    end

    def new
      @training_module = TrainingModule.new()
    end

    def edit
      @training_module = TrainingModule.find(params[:id])
    end
  end

  def create
      @training_module = TrainingModule.new(training_module_params)
      @training_module.user = @user

    if @training_module.save
      redirect_to training_module_path(@training_module)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @training_module = TrainingModule.find(params[:id])
    @training_module.user = current_user
    if @training_module.update(module_params)
      redirect_to training_module_path(@training_module)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def training_module_params
    params.require(:training_module).permit(:name, :active,:photo)
  end
