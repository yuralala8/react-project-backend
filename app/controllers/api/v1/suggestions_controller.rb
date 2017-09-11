class Api::V1::SuggestionsController < ApplicationController
  before_action :authorized, only: [:index]
  def index
    user = current_user
    render json: user.suggestions
  end

  def create

  	@suggestion = Suggestion.new(user_id: current_user.id, res_id: params[:res_id], vote_up: 0, vote_down: 0)
  	byebug
  end

  private

  def suggestion_params
  	params.require(:suggestion).permit(:res_id, :vote_up, :vote_down, :user_id)
  end

end
