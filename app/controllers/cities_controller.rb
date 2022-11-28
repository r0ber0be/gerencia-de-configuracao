# frozen_string_literal: true

# Cities Controller
class CitiesController < ApplicationController
  before_action :params_city, only: [:update]
  before_action :find_city, only: %i[show edit update destroy]

  def index
    @cities = City.all.page(params[:page])
  end

  def show; end

  def new
    @city = City.new
  end

  def create
    @city = City.new(params_city)
    if @city.save
      redirect_to new_city_info_path, notice: 'Cidade Registrada'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @city.update(params_city)
      redirect_to cities_path, notice: 'Cidade Atualizada'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_path, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def params_city
    params.require(:city).permit(:name, :state, :pop1991, :pop2000, :pop2010)
  end

  def find_city
    @city = City.find(params[:id])
  end
end
