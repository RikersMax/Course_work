class MainController < ApplicationController
  def index
    @test = ActiveRecord::Base.connection.execute("SELECT * FROM purposes")
    @test_arr = [{text: 'something'}]
  end
end
