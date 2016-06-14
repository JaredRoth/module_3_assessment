class BBService
  def initialize(params)
    @params = params
    @connection = Faraday.new(url: "https://api.bestbuy.com/")
    @connection.headers["X-Api-Key"] = ENV['BB_KEY']
  end

  def search_by_zip
    response = @connection.get "stores(postalCode=#{@params[:zip]},25)?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BB_KEY']}"
    JSON.parse(response.body, symbolize_names: true)
  end
end
