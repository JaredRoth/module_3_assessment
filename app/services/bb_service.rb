class BBService
  def initialize(params)
    @params = params
    @connection = Faraday.new(url: "https://api.bestbuy.com/")
  end

  def search_by_zip
    response = @connection.get "v1/stores(area(#{@params[:zip]},25))?format=json&show=storeId,longName,city,distance,phone,storeType&pageSize=25&apiKey=#{ENV['BB_KEY']}"
    @response = JSON.parse(response.body, symbolize_names: true)
  end

  def store
    response = @connection.get "v1/stores(storeId=#{@params[:store_id]})?format=json&show=name,storeType,address,city,region,postalCode,hoursAmPm&pageSize=25&apiKey=#{ENV['BB_KEY']}"
    @response = JSON.parse(response.body, symbolize_names: true)
  end
end
