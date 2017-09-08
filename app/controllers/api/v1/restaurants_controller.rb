require 'rest-client'
class Api::V1::RestaurantsController < ApplicationController

	def index
		term = params[:search]
		url ="https://developers.zomato.com/api/v2.1/search?q="+term+"&lat=40.705253&lon=-74.014070"
		restaurants = JSON.parse(RestClient.get(url, headers={'user-key': '46d92401d04f692193843afff4ed5aa4', 'Accept': 'application/json'}))
		render json: restaurants
	end


	private

	def restaurant_params
		params.require(:data).permit(:name)
	end

end