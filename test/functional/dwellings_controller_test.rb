require 'test_helper'

class DwellingsControllerTest < ActionController::TestCase
  setup do
    @dwelling = dwellings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dwellings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dwelling" do
    assert_difference('Dwelling.count') do
      post :create, dwelling: { name: @dwelling.name }
    end

    assert_redirected_to dwelling_path(assigns(:dwelling))
  end

  test "should show dwelling" do
    get :show, id: @dwelling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dwelling
    assert_response :success
  end

  test "should update dwelling" do
    put :update, id: @dwelling, dwelling: { name: @dwelling.name }
    assert_redirected_to dwelling_path(assigns(:dwelling))
  end

  test "should destroy dwelling" do
    assert_difference('Dwelling.count', -1) do
      delete :destroy, id: @dwelling
    end

    assert_redirected_to dwellings_path
  end
end
