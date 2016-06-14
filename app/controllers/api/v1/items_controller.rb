class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.select(:id, :name, :description, :image_url)
  end

  def show
    respond_with Item.select(:id, :name, :description, :image_url).find(params[:id])
  end

  def destroy
    # what the fuck
    respond_with status: 204 if Item.delete(params[:id])
  end

  def create
    # I am missing something retardedly simple
    respond_with Item.create(item_params)
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
