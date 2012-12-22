class RandomController < ApplicationController
  def show
    render json: Picture.random
  end
end
