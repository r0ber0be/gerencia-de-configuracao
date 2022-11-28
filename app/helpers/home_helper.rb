# frozen_string_literal: true

# Mathematics
module HomeHelper
  include ApplicationHelper

  EULER_EXPONENT = 2.718

  def years
    [2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030]
  end

  def rsu_value_by_year
    rsu_generated = []
    if @city.present?
      years.each do |year_key|
        rsu_generated.push(rsu_ton_year[year_key].round(2))
      end
    end
    rsu_generated
  end

  # leva em consideração o ano de 2010 e a quantidade de sua população,
  # o ano que se quer descobrir a população EX: 2021
  def estimated_pop_growth
    pop_years = {}
    if @city.present?
      kg = (Math.log(@city.pop2010) - Math.log(@city.pop2000)) / (2010 - 2000)
      years.each do |year|
        value = @city.pop2010 * (EULER_EXPONENT**(kg * (year - 2010))) # double star == exponent
        pop_years[year] = value
      end
    end
    pop_years
  end

  def population_value_by_year
    population = []
    years.each do |year_key|
      population.push(estimated_pop_growth[year_key])
    end
    population
  end

  def population
    current_year = DateTime.now.year
    {
      title: 'População',
      value: @city.present? ? estimated_pop_growth[current_year].round : 0,
      color: 'primary',
      icon: 'fa-comments'
    }
  end

  def economic_potential
    current_year = DateTime.now.year
    {
      title: 'Potêncial econômico',
      value: @city.present? ? total_potential_to_hash[current_year].round(2) : 0,
      is_money: true,
      color: 'success',
      icon: 'fa-dollar-sign'
    }
  end

  def rsu_generated
    current_year = DateTime.now.year
    {
      title: 'Resíduos Ton/ano',
      value: @city.present? ? rsu_ton_year[current_year].round(2) : 0,
      color: 'info',
      icon: 'fa-dollar-sign'
    }
  end

  def data_verification(city, data)
    city.present? ? data : 0
  end
end
