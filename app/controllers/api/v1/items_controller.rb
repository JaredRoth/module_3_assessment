class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.select(:id, :name, :description, :image_url)
  end

  def show
    respond_with Item.select(:id, :name, :description, :image_url).find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    respond_with item
  end
end
