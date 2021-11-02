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
      redirect_to root_path
    else
      flash[:alert] = gif.errors.messages[:file].join(', ')
      redirect_to gifs_new_path
    end

  end

  private


  def gif_params
    params.require(:gif).permit(:name, :description, :file)
  end

end
