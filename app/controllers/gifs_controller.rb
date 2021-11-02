class GifsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gif = current_user.gifs.new
  end

  def index
  end

  def create
    gif = current_user.gifs.new(gif_params)
    if gif.save
      flash[:notice] = 'Uploaded successfully !'
    else
      flash[:alert] = gif.errors.messages.join(', ')
    end

    redirect_to root_path
  end

  private


  def gif_params
    params.require(:gif).permit(:name, :description, :file)
  end

end
