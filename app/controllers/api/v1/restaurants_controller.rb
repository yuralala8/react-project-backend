require 'rest-client'
class Api::V1::RestaurantsController < ApplicationController

	def index
		
		place = params[:location]

		geourl = "https://maps.googleapis.com/maps/api/geocode/json?address="+place+"&key=AIzaSyBDRZcLLEYOajOLr5vbAtr9JFiTTYYIecE"
		lonlat = JSON.parse(RestClient.get(geourl, headers={'Accept': 'application/json'}))

		lat = lonlat.dig('results')[0].dig('geometry').dig('location').dig('lat').to_s
		lon = lonlat.dig('results')[0].dig('geometry').dig('location').dig('lng').to_s

		term = params[:search]

		url ="https://developers.zomato.com/api/v2.1/search?q="+term+"&lat="+lat+"&lon="+lon
		restaurants = JSON.parse(RestClient.get(url, headers={'user-key': '46d92401d04f692193843afff4ed5aa4', 'Accept': 'application/json'}))
		render json: restaurants

	end

	def show
		res_id = params[:id]
		url ="https://developers.zomato.com/api/v2.1/restaurant?res_id="+res_id
		restaurant = JSON.parse(RestClient.get(url, headers={'user-key': '46d92401d04f692193843afff4ed5aa4', 'Accept': 'application/json'}))
		render json: restaurant
	end


end