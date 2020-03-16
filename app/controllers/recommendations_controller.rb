class RecommendationsController < ApplicationController

  def index
    @recommendations = current_user.recommendations.where.not(user_id: current_user.id)
  end

  def new
    @cateogries = Category.pluck(:name, :id)
    @recommendation = Recommendation.new
  end

  def show; end

  def create
    user   = User.find_by email_address: params[:email_address]
    @recommendation = current_user.recommendations.create!(recommendation_params)
    @recommendation.users << user

    redirect_to recommendations_path
  end

  private

  def recommendation_params
    params.permit(:description, :category_id).merge(user_id: current_user.id)
  end

  def user_params
    params[:email_address]
  end

  def category_params
    params.permit(:category)
  end
end
