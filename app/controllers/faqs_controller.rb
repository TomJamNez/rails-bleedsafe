class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
        #needs updating after pundit, should be false by default, making true now for testing and demo.
    @faq.order = Faq.count + 1
    if @faq.save
      redirect_to faqs_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @faq = Faq.find(params[:id])
  end

  def update
    @faq = Faq.find(params[:id])
    if @faq.update(faq_params)
      redirect_to faqs_path
      else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def faq_params
    params.require(:faq).permit(:question, :answer)
  end

end
