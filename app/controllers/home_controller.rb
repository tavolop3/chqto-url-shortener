class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    home_stats
    render 'index_authenticated'
  end

  private

  def home_stats
    user = current_user
    links = user.links.includes(:accesses)
    @total_accesses_count = links.sum(&:accesses_count)
    top_links = links.sort_by { |link| -link.accesses_count }
    @pie_chart_data = top_links.map do |link|
      name = link.name.present? ? link.name : link.url
      [name, link.accesses_count]
    end.to_h
  end
end
