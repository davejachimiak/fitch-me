class PicturesController < ApplicationController
  before_filter :authorize_request

  def create
    picture = Picture.create(url: params[:url])
    render json: picture
  end

  private

  def authorize_request
    if params[:token] != DatAuth.dat_token
      head :unauthorized
      return false
    end
  end
end
