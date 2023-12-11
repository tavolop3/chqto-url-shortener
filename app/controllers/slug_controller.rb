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
      render 'require_password'
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
    case @link.type
    when 'EphemeralLink'
      forbidden if @link.unusable?
    when 'TemporalLink'
      not_found_temporal if @link.expired?
    when 'PrivateLink'
      render 'require_password'
    end
  end

  def register_access
    Access.create!(link: @link, ip_address: request.remote_ip)
  end
end
