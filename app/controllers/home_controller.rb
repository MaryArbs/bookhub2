class HomeController < ApplicationController
  before_action :current_user
  def index
    "hello"
  end
end
