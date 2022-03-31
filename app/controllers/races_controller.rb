class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]
  before_action :skip_authorization, only: :show
  before_action :skip_policy_scope, only: :index

  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @races = Race.all
  end

  def new
    @race = Race.new
    authorize @race
  end

  def create
    @race = Race.new(race_params)
    @race.user = current_user
    authorize @race
    if @race.save
      redirect_to race_path(@race), notice: 'Race was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @race
  end

  def update
    authorize @race
    @race.update(race_params)
    redirect_to race_path(@race)
  end

  def destroy
    authorize @race
    @race.destroy
    redirect_to races_path
  end

  private

  def set_race
    @race = Race.find(params[:id])
  end

  def race_params
    params.require(:race).permit(:name, :description)
  end
end
