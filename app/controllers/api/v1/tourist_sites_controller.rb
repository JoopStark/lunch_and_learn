class Api::V1::TouristSitesController < ApplicationController
  def index
    render TouristSiteFacade.index(params[:country])
  end
end