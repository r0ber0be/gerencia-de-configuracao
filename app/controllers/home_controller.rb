# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper

  def index
    @all_cities = City.all.map { |c| [c.name, c.id] }
    @city = City.find(params[:city]) if params[:city].present?

    @data = GenerateGraphsPresenter.new(@city)
    @data_chart = @data.data_chart.to_json
    @data_pie_chart = @data.data_pie_chart.to_json
    @data_line_chart = @data.data_line_chart.to_json
    @data_bar_chart = @data.data_bar_chart.to_json

    @all_tasks = {
      title: 'Server Migration',
      progress: 20,
      isFinished: false,
      color: 'bg-danger'
    },
                 {
                   title: 'Sales Tracking',
                   progress: 40,
                   isFinished: false,
                   color: 'bg-warning'
                 },
                 {
                   title: 'Customer Database',
                   progress: 60,
                   isFinished: false,
                   color: 'bg-info'
                 },
                 {
                   title: 'Payout Details',
                   progress: 40,
                   isFinished: false,
                   color: 'bg-primary'
                 },
                 {
                   title: 'Account Setup',
                   progress: 100,
                   isFinished: true,
                   color: 'bg-success'
                 }

    @earnings = {
      deposits: 290.29
    }

    @cards =
      rsu_generated,
      population,
      economic_potential,
      {
        title: 'Custos com RSU',
        value: '$2.070.000',
        color: 'warning',
        icon: 'fa-dollar-sign'
      }
  end
end
