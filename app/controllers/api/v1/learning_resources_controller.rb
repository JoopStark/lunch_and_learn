class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceFacade.resources(params[:country])
  end
end