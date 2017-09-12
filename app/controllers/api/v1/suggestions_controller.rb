class Api::V1::SuggestionsController < ApplicationController
  before_action :authorized, only: [:index, :create, :update, :destroy]
  def index
  	render json: Suggestion.vote_order
  end

  def create
  
  	@suggestion = Suggestion.new(user_id: current_user[:id], username: current_user[:username], res_id: params[:res_id], vote_up: 0, vote_down: 0, res_name: params[:res_name], res_cuisines: params[:res_cuisines], res_location: params[:res_location], res_image: params[:res_image], res_url: params[:res_url], res_user_rating: params[:res_user_rating], res_menu_url: params[:res_menu_url])

  	@suggestion.save

  	index
  end

  def update
  	@suggestion = Suggestion.find(params[:id])
  	if params[:vote] == "up"
  		@suggestion.update(vote_up: @suggestion.vote_up + 1)
  	elsif params[:vote] == "down"
  		@suggestion.update(vote_down: @suggestion.vote_down + 1)
  	end

  	index

  end

  def destroy
  	@suggestion = Suggestion.find(params[:id])
  	@suggestion.destroy

  	index

  end



  private

  def suggestion_params
  	params.require(:suggestion).permit(:res_id, :vote_up, :vote_down, :username, :user_id, :res_name, :res_cuisines, :res_location, :res_menu_url, :res_image, :res_url, :res_user_rating)
  end

end
