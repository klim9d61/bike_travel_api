class API::V1::TravelCategoriesController < ApplicationController

  layout false

  #before_action :authenticate

  def index
    travel_categories = TravelCategory.order("position ASC")
    #travel_categories = @subject.travel_categories
    render json: travel_categories, status: 200
  end


  private

  def travel_category_params
    params.require(:travel_category).permit(:subject_id, :name, :position, :visible)
  end

end