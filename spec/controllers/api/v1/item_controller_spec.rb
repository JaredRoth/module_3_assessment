require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  it "#index" do
    create_list(:item, 2)

    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success

    expect(parsed_json.count).to eq(2)
    expect(parsed_json.first["name"]).to eq("Jeans")
    expect(parsed_json.first["description"]).to eq("They be tight")
    expect(parsed_json.first["image_url"]).to eq("http://www.google.com")
    expect(parsed_json.first["created_at"]).to eq(nil)
    expect(parsed_json.first["updated_at"]).to eq(nil)
  end
end
