class SlugController < ApplicationController
  before_action :load_link
  before_action :check_types, only: [:show]

  def show
    redirect_to_url
  end

  def authenticate
    if @link.check_password(params[:password])
      redirect_to_url
    else
      flash.alert = 'Contraseña incorrecta'
      redirect_to authenticate_slug_path(@link.slug)
    end
  end

  private

  def load_link
    @link = Link.find_by(slug: params[:slug]) or not_found
  end

  def redirect_to_url
    register_access
    redirect_to @link.url, allow_other_host: true
  end

  def check_types
    forbidden if @link.unusable?
    not_found if @link.expired? # Temporal/Ephemeral checks
    render 'require_password' if @link.private?
  end

  def register_access
    Access.create!(link: @link, ip_address: request.remote_ip)
  end
end
