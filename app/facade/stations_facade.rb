class StationsFacade

  def initialize(data)
    @zip = data
  end

  def stations
    response = conn
    require "pry"; binding.pry
  end

  def conn
    Faraday.new(:url => "'https://developer.nrel.gov/api/alt-fuel-stations.v1?limit=10") do |f|
      f.headers['X-Api-Key'] = ENV['X-API-KEY']
      f.adapter Faraday.default_adapter
    end 
  end
end
