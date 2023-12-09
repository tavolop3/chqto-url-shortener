class SlugController < ApplicationController
  before_action :load_link, :load_handler

  def show
    @handler.handle
    redirect_to_url
  end

  private

  def load_link
    @link = Link.find_by(slug: params[:slug]) or not_found
  end

  def load_handler
    handler_class = Object.const_get("#{@link.type}Handler")
    @handler = handler_class.new(@link)
  end

  def authenticate
    redirect_to_url if @handler.authenticate

    flash.alert = 'Contraseña incorrecta'
    redirect_to slug_path(@link.slug)
  end

  def redirect_to_url
    register_access
    redirect_to @link.url, allow_other_host: true
  end

  def register_access
    Access.create!(link: @link, ip_address: request.remote_ip)
  end
end
