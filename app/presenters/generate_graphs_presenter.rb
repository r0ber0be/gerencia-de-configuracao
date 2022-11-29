# frozen_string_literal: true

class GenerateGraphsPresenter
  include HomeHelper

  def initialize(city)
    @city = city
  end

  def data_chart
    {
      type: 'bar',
      labels: years,
      datasets: {
        label: 'Populacão',
        data: data_verification(@city, population_value_by_year)
      }
    }
  end

  def data_pie_chart
    return unless @city.present?

    {
      type: 'doughnut',
      labels: %w[1991 2000 2010],
      labelsColor: %w[#4e73df #1cc88a #36b9cc],
      datasets: {
        data: [@city.pop1991, @city.pop2000, @city.pop2010]
      }
    }
  end

  def data_line_chart
    {
      labels: years,
      datasets: {
        label: 'RSU',
        data: data_verification(@city, rsu_value_by_year)
      }
    }
  end

  def data_bar_chart
    {
      type: 'bar',
      data: {
        labels: years,
        datasets: {
          label: 'Valor economizado',
          data: data_verification(@city, total_economic_potential)
        }
      }
    }
  end
end
