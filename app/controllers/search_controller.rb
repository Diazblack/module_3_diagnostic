class SearchController < ApplicationController
  def index
    @facade = Facade.new(params[:q])
  end
end
