class PropublicaService

  def members_of_house(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON(response.body, symbolize_names: true)
    #PURPOSE: given a faraday connection return house members 
    # and turn it into a HASH 
  end

  def conn 
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    #PURPOSE: hit the api and return the faraday connection (conn)
  end

end