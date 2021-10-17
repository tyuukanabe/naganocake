class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end
  
end

