class PicturesController < ApplicationController
  def create
    Picture.create(url: params[:url])
  end
end
