class SearchController < ApplicationController
  def index
    @results = BBService.new(params).search_by_zip
  end
end
