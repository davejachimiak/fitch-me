class PicturesController < ApplicationController
  def create
    if params[:token] != DatAuth.dat_token
      head :unauthorized
    else
      Picture.create(url: params[:url])
    end
  end
end
