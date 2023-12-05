class SlugController < ApplicationController
  def show
    @link = Link.find_by(slug: params[:slug])
    redirect_to "#{@link.url}", allow_other_host: true
  end
end
