class AddPictureRequestsController < ApplicationController
  def new
  end

  def create
    AddPictureRequestMailer.add_picture_request(params[:url]).deliver
  end
end
