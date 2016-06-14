class SearchController < ApplicationController
  def index
    @results = BBService.new(params).search_by_zip
  end

  def show
    @store = BBService.new(params).store[:stores].first
    @hours = @store[:hoursAmPm].split(';')
  end
end
