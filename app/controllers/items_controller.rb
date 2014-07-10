class ItemsController < ApplicationController
  def index
  	@list = List.find(params[:list_id])
  	@items = @list.items
  end

  def show
  	@list = List.find(params[:list_id])
  	@item = @list.items.find(params[:id])
  end

  def new
  	@list = List.find(params[:list_id])
  	@item = @list.items.build
  end

  def create
  	@list = List.find(params[:list_id])
  	@item = @list.items.build(item_params)
  	if @item.save
  		redirect_to list_item_url(@list, @item)
  	else
  		render :action => "new"
  	end
  end

  def edit
  	@list = List.find(params[:list_id])
  	@item = @list.items.find(params[:id])
  end

  def update
  	@list = List.find(params[:list_id])
  	@item = Item.find(params[:id])
  	if @item.update_attributes(item_params)
  		redirect_to list_item_url(@list, @item)
  	else
  		render :action => "edit"
  	end
  end

  def destroy
  	@list = List.find(params[:list_id])
  	@item = Item.find(params[:id])
  	@item.destroy

    redirect_to list_items_path(@list)

  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end

end

