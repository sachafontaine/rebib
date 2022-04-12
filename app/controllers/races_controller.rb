class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]
  before_action :skip_authorization, only: :show
  before_action :skip_policy_scope, only: :index

  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    if params[:query].present?
      @races = Race.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @races = Race.all
    end
    @markers = @races.geocoded.map do |race|
      {
        lat: race.latitude,
        lng: race.longitude,
        info_window: render_to_string(partial: "info_window", locals: { race: race }),
        image_url: helpers.asset_url("https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Running_icon_-_Noun_Project_17825.svg/1200px-Running_icon_-_Noun_Project_17825.svg.png")
      }
    end
  end

  def new
    @race = Race.new
    authorize @race
  end

  def create
    @race = Race.new(race_params)
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
    params.require(:race).permit(:name, :address, :date, :sport, :photo)
  end
end
