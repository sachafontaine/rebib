class BibsController < ApplicationController
  before_action :set_bib, only: [:show, :edit, :update, :destroy]
  before_action :skip_authorization, only: :show
  before_action :skip_policy_scope, only: :index

  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @bibs = Bib.all
  end

  def new
    @bib = Bib.new
    @races = Race.all
    authorize @bib
  end

  def create
    @bib = Bib.new(bib_params)
    authorize @bib
    @bib.user = current_user
    # @bib.race = Race.find(params[:race_id])
    @bib.race_id = params[:bib][:race_id]
    if @bib.save
      redirect_to dashboard_path, notice: 'Bib was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @bib
  end

  def update
    authorize @bib
    @bib.update(bib_params)
    redirect_to bib_path(@bib)
  end

  def destroy
    authorize @bib
    @bib.destroy
    redirect_to bibs_path
  end

  private

  def set_bib
    @bib = Bib.find(params[:id])
  end

  def bib_params
    params.require(:bib).permit(:race, :price)
  end
end
