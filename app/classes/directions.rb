class Directions

  def initialize(params, locale)
    locale = locale == 'en' ? 'en' : 'no'
    to = params[:position].nil? ? params[:to] : params[:position]
    from = params[:location].nil? ? params[:from] : params[:location]
    url = URI("https://maps.googleapis.com/maps/api/directions/json?origin=#{from}&destination=#{to}&mode=transit&alternatives=true&language=#{locale}&key=#{ENV['GOOGLE_MAPS_API']}")
    @direction = JSON.parse(Net::HTTP.get(url))
  end

  def routes
    @direction['routes'].map { |routes| Routes.new(routes) }
  end
end