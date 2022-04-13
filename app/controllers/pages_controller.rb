class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :ressources, :calcul_allure, :programme, :alimentation, :shop ]

  def home
    @races = Race.all
  end

  def ressources
  end

  def calcul_allure
  end

  def programme
  end

  def alimentation
  end

  def shop
  end
end
