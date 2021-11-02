class GifsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gif = current_user.gifs.new
  end

  def index
  end

  def create
  end
end
