class UsersController < ApplicationController
  before_action :skip_policy_scope, only: :index
  skip_before_action :authenticate_user!, only: :index

  def index
    @users = User.all
  end
end
