class RandomController < ApplicationController
  def show
    Picture.connection.execute "select setseed(#{rand})"
    random_picture = Picture.order('random()').first
    render json: random_picture
  end
end
