require 'test_helper'

class WeathersControllerTest < ActionController::TestCase
  setup do
    @weather = weathers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weathers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather" do
    assert_difference('Weather.count') do
      post :create, weather: { currentTime: @weather.currentTime, currentWeather: @weather.currentWeather, elevation: @weather.elevation, fish_id: @weather.fish_id, location: @weather.location, moonPercentage: @weather.moonPercentage, observationLocation: @weather.observationLocation, observationLocationElevation: @weather.observationLocationElevation, observationTime: @weather.observationTime, precipToday: @weather.precipToday, relative_humidity: @weather.relative_humidity, temperature: @weather.temperature, weather_info: @weather.weather_info, windInformation: @weather.windInformation, zipCode: @weather.zipCode }
    end

    assert_redirected_to weather_path(assigns(:weather))
  end

  test "should show weather" do
    get :show, id: @weather
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather
    assert_response :success
  end

  test "should update weather" do
    patch :update, id: @weather, weather: { currentTime: @weather.currentTime, currentWeather: @weather.currentWeather, elevation: @weather.elevation, fish_id: @weather.fish_id, location: @weather.location, moonPercentage: @weather.moonPercentage, observationLocation: @weather.observationLocation, observationLocationElevation: @weather.observationLocationElevation, observationTime: @weather.observationTime, precipToday: @weather.precipToday, relative_humidity: @weather.relative_humidity, temperature: @weather.temperature, weather_info: @weather.weather_info, windInformation: @weather.windInformation, zipCode: @weather.zipCode }
    assert_redirected_to weather_path(assigns(:weather))
  end

  test "should destroy weather" do
    assert_difference('Weather.count', -1) do
      delete :destroy, id: @weather
    end

    assert_redirected_to weathers_path
  end
end
