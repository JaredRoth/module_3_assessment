class SearchController < ApplicationController
  def index
    @results = BBService.new(params).search_by_zip
  end

  def show
    @store = BBService.new(params).store
  end
end
