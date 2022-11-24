class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:new]
  def index
  end

  def new
    @item = Item.new
  end  
end
