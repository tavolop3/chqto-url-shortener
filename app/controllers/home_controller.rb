class HomeController < ApplicationController
  def index
    if user_signed_in?
      render 'index_authenticated'
    else
      render 'index_unauthenticated'
    end
  end
end
