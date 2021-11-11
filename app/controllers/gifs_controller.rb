class GifsController < ApplicationController
  before_action :authenticate_user!

  def new
    @gif = current_user.gifs.new
  end

  def index
    @gifs = current_user.gifs
  end

  def create
    gif = current_user.gifs.new(gif_params)
    if params[:gif][:tag_list]
      gif.tag_list.add(params[:gif][:tag_list])
    end
    if gif.save
      flash[:notice] = 'Uploaded successfully !'
      redirect_to gifs_path
    else
      flash[:alert] = gif.errors.messages[:file].join(', ')
      redirect_to gifs_new_path
    end

  end

  private


  def gif_params
    params.require(:gif).permit(:name, :description, :file, { tag_list: [] })
  end

end
