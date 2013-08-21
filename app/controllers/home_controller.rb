class HomeController < ApplicationController
  def index
    @testimonial = Testimonial.all

    @marketing = MarketingBullet.all
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
