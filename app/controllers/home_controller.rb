class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :current_user
  def index
    "hello"
  end
end
