class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @user_lists = current_user.lists.all
  end

  def show
    #@user_lists = current_user.lists.all
  end

  def new
    @list = current_user.lists.build
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)
      if @list.save
        redirect_to lists_url
      else
        render :action => "new"
      end
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update_attributes(list_params)
      redirect_to list_url(@list)
    else
      render :action => "edit"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path(@list) }
      format.xml  { head :ok }
    end
  end

  private
    
    def set_list
      @list = current_user.lists.find_by(id: params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :description)
    end
end
