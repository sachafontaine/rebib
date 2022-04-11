class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ressources, :calcul_allure ]

  def home
    @races = Race.all
  end

  def ressources

  end

  def calcul_allure

  end
end
