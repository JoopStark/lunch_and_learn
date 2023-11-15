class Api::V1::UsersController < ApplicationController
  def create
    render UserFacade.create(params) 
  end
end