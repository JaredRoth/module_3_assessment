class BBService
  def initialize(params)
    @params = params
    @connection = Faraday.new(url: "https://api.bestbuy.com/")
  end

  def search_by_zip
    response = @connection.get "v1/stores(area(#{@params[:zip]},25))?format=json&show=longName,city,distance,phone,storeType&apiKey=#{ENV['BB_KEY']}"
    @response = JSON.parse(response.body, symbolize_names: true)
  end
end
