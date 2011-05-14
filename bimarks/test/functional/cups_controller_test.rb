require 'test_helper'

class CupsControllerTest < ActionController::TestCase
  setup do
    @cup = cups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cup" do
    assert_difference('Cup.count') do
      post :create, :cup => @cup.attributes
    end

    assert_redirected_to cup_path(assigns(:cup))
  end

  test "should show cup" do
    get :show, :id => @cup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cup.to_param
    assert_response :success
  end

  test "should update cup" do
    put :update, :id => @cup.to_param, :cup => @cup.attributes
    assert_redirected_to cup_path(assigns(:cup))
  end

  test "should destroy cup" do
    assert_difference('Cup.count', -1) do
      delete :destroy, :id => @cup.to_param
    end

    assert_redirected_to cups_path
  end
end
