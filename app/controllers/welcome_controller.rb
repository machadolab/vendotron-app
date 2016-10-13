class WelcomeController < ApplicationController

  def index

  end

  def open
    Carousel.open(params[:row])
    render :inline => "done for #{params[:row]}"
  end

  def rotate
    Carousel.rotate(params[:angle])
    render :inline => "done for #{params[:angle]}"
  end

end
