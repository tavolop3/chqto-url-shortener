class TemporalLinkHandler
  def initialize(link)
    @link = link
  end

  def handle
    raise ActionController::RoutingError, 'Not Found' if @link.expired?
  end
end
