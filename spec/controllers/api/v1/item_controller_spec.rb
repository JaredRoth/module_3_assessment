require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "#index" do
    create_list(:item, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response 200

    expect(parsed_json.count).to eq(2)
    expect(parsed_json.first["name"]).to eq("Jeans")
    expect(parsed_json.first["description"]).to eq("They be tight")
    expect(parsed_json.first["image_url"]).to eq("http://www.google.com")
    expect(parsed_json.first["created_at"]).to eq(nil)
    expect(parsed_json.first["updated_at"]).to eq(nil)
  end

  it "#show" do
    create(:item)
    id = Item.first.id

    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response 200

    expect(parsed_json["id"]).to eq(id)
    expect(parsed_json["name"]).to eq("Jeans")
    expect(parsed_json["description"]).to eq("They be tight")
    expect(parsed_json["image_url"]).to eq("http://www.google.com")
    expect(parsed_json["created_at"]).to eq(nil)
    expect(parsed_json["updated_at"]).to eq(nil)
  end

  it "#destroy" do
    skip
    create(:item)
    id = Item.first.id

    delete :destroy, id: id

    assert_response 204

    expect(parsed_json.count).to eq(0)
  end

  it "#create" do
    post :create, name: "Pants", description: "Clothes", image_url: "a url"
    parsed_json = JSON.parse(response.body)

    assert_response 201

    expect(Item.first.name).to eq("Pants")
    expect(Item.first.description).to eq("Clothes")
    expect(Item.first.image_url).to eq("a url")
  end
end
