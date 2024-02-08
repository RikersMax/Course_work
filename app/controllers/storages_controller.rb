class StoragesController < ApplicationController

  def index
    @products = Product.all
  end

end
