class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to current_user and return
    end
    @pics = Pic.order("RANDOM()")[0..2]
    render layout: false
  end
end
