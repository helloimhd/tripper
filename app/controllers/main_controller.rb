class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to "/trips"
  end
end