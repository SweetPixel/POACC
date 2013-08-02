class HomeController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def staff
  end

  def faq
  	@faq_categories = FaqCategory.all
  end
end
