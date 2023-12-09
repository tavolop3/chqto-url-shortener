class PrivateLinkHandler
  def initialize(link)
    @link = link
  end

  def handle
    render 'require_password' if @link.private?
  end

  def authenticate
    @link.check_password(params[:password])
  end
end
