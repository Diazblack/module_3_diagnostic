class Facade

  def initialize(data)
    @zip = data
  end

  def stations
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?radius=6.0&location=#{@zip.to_i}&fuel_type=ELEC&fuel_type=LPG&limit=10")

    JSON.parse(response.body, symbolize_names: true)
    stations = js[:fuel_stations].map do |station|
      Station.new(station)
    end
  end

  def conn
    Faraday.new(:url => "https://developer.nrel.gov") do |f|
      f.headers['X-Api-Key'] = ENV['X-API-KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
