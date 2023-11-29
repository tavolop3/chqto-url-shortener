class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    render 'index_authenticated'
  end
end
