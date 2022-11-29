# frozen_string_literal: true

module ApplicationHelper
  COEF_PER_CAPITA = 1.05
  # Materials
  VIDRO = 3.99
  METAL_FERROSO = 5.76
  METAL_NAO_FERROSO = 5.76
  PLASTICO_FILME = 9.22
  PLASTICO_RIGIDO = 7.67
  PAPEL_PAPELAO = 5.57

  def rsu_ton_day
    rsu_daily = []
    if @city.present?
      population_value_by_year.each do |pop|
        rsu_daily.push((pop * 1 * COEF_PER_CAPITA) / 1000)
      end
    end
    rsu_daily
  end

  # calculates the amount of waste(in ton) produced in a year by a given population
  def rsu_ton_year
    rsu_growth = []
    rsu_ton_day.each do |t|
      rsu_growth.push(t * 365)
    end
    years.zip(rsu_growth).to_h
  end

  def vidro_ton_day
    calculates_ton_rsu_per_day(VIDRO, rsu_ton_day)
  end

  def vidro_ton_year
    calculates_ton_rsu_per_year(vidro_ton_day)
  end

  # METAL FERROSO
  def metal_ferroso_ton_day
    calculates_ton_rsu_per_day(METAL_FERROSO, rsu_ton_day)
  end

  def metal_ferroso_ton_year
    calculates_ton_rsu_per_year(metal_ferroso_ton_day)
  end

  # METAL NÃO FERROSO
  def metal_nao_ferroso_ton_day
    calculates_ton_rsu_per_day(METAL_NAO_FERROSO, rsu_ton_day)
  end

  def metal_nao_ferroso_ton_year
    calculates_ton_rsu_per_year(metal_nao_ferroso_ton_day)
  end

  # PLASCTICO FILME
  def plastico_filme_ton_day
    calculates_ton_rsu_per_day(PLASTICO_FILME, rsu_ton_day)
  end

  def plastico_filme_ton_year
    calculates_ton_rsu_per_year(plastico_filme_ton_day)
  end

  # PLASTICO RIGIDO
  def plastico_rigido_ton_day
    calculates_ton_rsu_per_day(PLASTICO_RIGIDO, rsu_ton_day)
  end

  def plastico_rigido_ton_year
    calculates_ton_rsu_per_year(plastico_rigido_ton_day)
  end

  # PAPEL/PAPELÃO
  def papel_papelao_ton_day
    calculates_ton_rsu_per_day(PAPEL_PAPELAO, rsu_ton_day)
  end

  def papel_papelao_ton_year
    calculates_ton_rsu_per_year(papel_papelao_ton_day)
  end

  # POTENCIAL?
  def potencial_vidro
    calculates_rsu_year_potential(vidro_ton_year, 0.08)
  end

  def potencial_metal_ferroso
    calculates_rsu_year_potential(metal_ferroso_ton_year, 0.12)
  end

  def potencial_metal_nao_ferroso
    calculates_rsu_year_potential(metal_nao_ferroso_ton_year, 4.9)
  end

  def potencial_plastico_filme
    calculates_rsu_year_potential(plastico_filme_ton_year, 0.3)
  end

  def potencial_plastico_rigido
    calculates_rsu_year_potential(plastico_rigido_ton_year, 0.8)
  end

  def potencial_papel_papelao
    calculates_rsu_year_potential(papel_papelao_ton_year, 0.13)
  end

  def total_economic_potential
    potential_by_year = []
    if @city.present?
      years.each do |year|
        pv = potencial_vidro[year]
        pmf = potencial_metal_ferroso[year]
        pmnf = potencial_metal_nao_ferroso[year]
        ppf = potencial_plastico_filme[year]
        ppr = potencial_plastico_rigido[year]
        ppp = potencial_papel_papelao[year]
        potential_by_year.push(pv + pmf + pmnf + ppf + ppr + ppp)
      end
    end
    potential_by_year
  end

  def total_potential_to_hash
    years.zip(total_economic_potential).to_h
  end

  # CUSTO ??
  private

  def calculates_ton_rsu_per_day(constant, array_rsu)
    daily_rsu = []
    if @city.present?
      array_rsu.each do |rsu_value|
        daily_rsu.push(rsu_value * (constant / 100))
      end
    end
    years.zip(daily_rsu).to_h
  end

  def calculates_ton_rsu_per_year(array_rsu)
    rsu_year = []
    if @city.present?
      array_rsu.each do |rsu_day|
        rsu_year.push(rsu_day[1] * 365)
      end
    end
    years.zip(rsu_year).to_h
  end

  def calculates_rsu_year_potential(rsu_ton_year, price)
    gravimetria_rsu = []
    if @city.present?
      rsu_ton_year.each do |rsu|
        gravimetria_rsu.push(price * 1000 * rsu[1]) # 0.08 é o preço
      end
    end
    years.zip(gravimetria_rsu).to_h
  end
end
