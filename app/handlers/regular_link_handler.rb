class RegularLinkHandler
  def initialize(link)
    @link = link
  end

  def handle
    true
  end

  def authenticate
    @link.check_password(params[:password])
  end
end
