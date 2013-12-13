require 'test_helper'

class FishControllerTest < ActionController::TestCase
  setup do
    @fish = fish(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fish)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fish" do
    assert_difference('Fish.count') do
      post :create, fish: { caught_on: @fish.caught_on, fish_length: @fish.fish_length, fish_type: @fish.fish_type, fish_weight: @fish.fish_weight, latitude: @fish.latitude, longitude: @fish.longitude }
    end

    assert_redirected_to fish_path(assigns(:fish))
  end

  test "should show fish" do
    get :show, id: @fish
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fish
    assert_response :success
  end

  test "should update fish" do
    patch :update, id: @fish, fish: { caught_on: @fish.caught_on, fish_length: @fish.fish_length, fish_type: @fish.fish_type, fish_weight: @fish.fish_weight, latitude: @fish.latitude, longitude: @fish.longitude }
    assert_redirected_to fish_path(assigns(:fish))
  end

  test "should destroy fish" do
    assert_difference('Fish.count', -1) do
      delete :destroy, id: @fish
    end

    assert_redirected_to fish_index_path
  end
end
