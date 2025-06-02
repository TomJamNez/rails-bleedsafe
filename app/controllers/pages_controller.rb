class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :questions, :about_us]

  def home
  end

  def dashboard
  end

  def questions
    @questions = Faq.all.order(position: :asc)
  end

  def about_us
  end

end
