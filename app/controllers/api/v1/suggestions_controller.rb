class Api::V1::SuggestionsController < ApplicationController
  before_action :authorized, only: [:index, :create]
  def index
    user = current_user
    render json: user.suggestions
  end

  def create
  	@suggestion = Suggestion.new(user_id: current_user[:id], username: current_user[:username], res_id: params[:res_id], vote_up: 0, vote_down: 0)
  	@suggestion.save
  	all_suggestions = Suggestion.all
  	render json: all_suggestions
  end

  private

  def suggestion_params
  	params.require(:suggestion).permit(:res_id, :vote_up, :vote_down, :username, :user_id)
  end

end
