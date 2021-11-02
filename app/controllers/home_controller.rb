class HomeController < ApplicationController
  def index
    @gifs = Gif.paginate(page: params[:page] || 1)
  end
end
