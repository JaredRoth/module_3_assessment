class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.select(:id, :name, :description, :image_url)
  end
end
