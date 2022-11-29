# frozen_string_literal: true

require 'test_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  setup do
    sign_in users(:example)
    @city = cities(:one)
  end

  test 'should get new' do
    get new_city_path
    assert_response :success
  end

  test 'should not get new if signed out' do
    sign_out users(:example)
    get new_city_path
    assert_response :redirect
  end

  test 'should show city' do
    get city_path(@city)
    assert_response :success
  end

  test 'should not show city if signed out' do
    sign_out users(:example)
    get city_path(@city)
    assert_response :redirect
  end

  test 'should get edit' do
    get edit_city_path(@city)
    assert_response :success
  end

  test 'should not get edit if signed out' do
    sign_out users(:example)
    get edit_city_path(@city)
    assert_response :redirect
  end
end
