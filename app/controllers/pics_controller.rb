class PicsController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource :pic, through: [:user], shallow: true, param_method: :pic_sanitizer

  def show
    if params[:type] == 'modal'
      render template: 'pics/modal', layout: false
    end
  end

  def new
    @title = "Upload a picture"
  end

  def edit
    @title = "Edit your pix"
  end

  def create
    if @pic.save
      flash[:notice] = "Pic created"
      redirect_to @pic
    else
      flash.now[:alert] = "Pic not created"
      render :new
    end
  end

  def update
    if @pic.update_attributes pic_sanitizer
      flash[:notice] = "Pic updated"
      redirect_back_or_default @pic
    else
      flash.now[:alert] = "Pic not updated"
      render :edit
    end
  end

  def destroy
    if @pic.destroy
      flash[:notice] = "Picture successfully destroyed"
      redirect_to @pic.user
    else
      flash[:alert] = "Picture not destroyed"
      render @pic
    end
  end

private
  def pic_sanitizer
    params.require(:pic).permit(:title, :description, :image, :user_id)
  end
end
