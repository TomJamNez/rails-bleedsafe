class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :faq, :about_us]

  def home
  end

  def dashboard
  end

  def faq
  end

  def about_us
  end

end
