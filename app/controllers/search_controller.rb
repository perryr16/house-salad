class SearchController < ApplicationController

  def index
    search_results = SearchResults.new
    @members = search_results.members(params[:state])
    # PURPOSE: generate a new search, pass members object to view
  end

end


#KEY: OennVw2ZeKohjpjZyRTR9Te1sDT0IygMUsygp34Y

# X-API-Key: PROPUBLICA_API_KEY
# To authorize, use this code:

# With shell, you can just pass the correct header with each request
# curl "api_endpoint_here"
#   -H "X-API-Key: PROPUBLICA_API_KEY"


# GET https://api.propublica.org/congress/v1/members/{chamber}/{state}/{district}/current.json