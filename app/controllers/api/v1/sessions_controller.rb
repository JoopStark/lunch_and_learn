class Api::V1::SessionsController < ApplicationController
  def create
    render SessionFacade.create(params)
  end
end