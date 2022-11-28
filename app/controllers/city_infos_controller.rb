# frozen_string_literal: true

# Done
class CityInfosController < ApplicationController
  before_action :params_city_info, only: [:update]
  before_action :set_city_info, only: %i[edit update destroy]

  def index
    @city_infos = CityInfo.all
  end

  def new
    @all_cities = City.all.map { |c| [c.name, c.id] }
    @city_info = CityInfo.new
  end

  def create
    @city_info = CityInfo.new(params_city_info)
    if @city_info.save
      redirect_to city_infos_path, notice: 'Informações de Cidade Registrada'
    else
      render :new, notice: 'Algo deu errado'
    end
  end

  def edit
    @all_cities = City.all.map { |c| [c.name, c.id] }
  end

  def update
    if @city_info.update(params_city_info)
      redirect_to city_infos_path, notice: 'Informações de Cidade Atualizada'
    else
      render :edit
    end
  end

  def destroy
    if @city_info.destroy
      redirect_to city_infos_path, notice: 'Informações de Cidade Excluída'
    else
      render :index
    end
  end

  private

  def params_city_info
    params.require(:city_info).permit(
      :city_id, :coef_rsu_per_capita, :coef_metal_ferroso,
      :coef_metal_nao_ferroso, :coef_plastico_filme, :coef_plastico_rigido, :coef_papel_papelao,
      :coef_vidro, :price_metal_ferroso, :price_metal_nao_ferroso, :price_plastico_filme,
      :price_plastico_rigido, :price_papel_papelao, :price_vidro
    )
  end

  def set_city_info
    @city_info = CityInfo.find(params[:id])
  end
end
