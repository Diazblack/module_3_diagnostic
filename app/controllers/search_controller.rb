class SearchController < ApplicationController
  def index
    @facade = StationsFacade.new(params[:q])
  end
end
