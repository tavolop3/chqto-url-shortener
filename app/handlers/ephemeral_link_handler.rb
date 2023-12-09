class EphemeralLinkHandler
  def initialize(link)
    @link = link
  end

  def handle
    raise ActionController::RoutingError, 'Forbidden' if @link.unusable?
  end
end
