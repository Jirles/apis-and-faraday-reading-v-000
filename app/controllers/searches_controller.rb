class SearchesController < ApplicationController
  def search
  end

  def foursquare
    begin
      @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'client_id' #=> removed actual client_id
        req.params['client_secret'] = 'client_secret' #=> removed actual client secret 
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
      end
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body_hash["response"]["venues"]
      else
        @error = body_hash["meta"]["errorDetail"]
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
=======
    Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = '4KJBAQ5FMO3Z0EJP4OWNYFTB4JBMOTP40Z3J1SZJZ2E2WCPS'
      req.params['client_secret'] = '3ZBEF2CZLQDPZDADQ31T2CJSXEUHOCMTXYRU3KPO0D1GFRWM'
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
>>>>>>> b862f92b5803d4f61a54fef6aadc23e6388866d1
    end
    render 'search'
  end

end
