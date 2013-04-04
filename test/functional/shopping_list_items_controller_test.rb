require 'test_helper'

class ShoppingListItemsControllerTest < ActionController::TestCase
  setup do
    @shopping_list_item = shopping_list_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_list_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_list_item" do
    assert_difference('ShoppingListItem.count') do
      post :create, shopping_list_item: { name: @shopping_list_item.name, obligate_id: @shopping_list_item.obligate_id, obligates: @shopping_list_item.obligates, quantity: @shopping_list_item.quantity, shopping_list_id: @shopping_list_item.shopping_list_id, status: @shopping_list_item.status }
    end

    assert_redirected_to shopping_list_item_path(assigns(:shopping_list_item))
  end

  test "should show shopping_list_item" do
    get :show, id: @shopping_list_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_list_item
    assert_response :success
  end

  test "should update shopping_list_item" do
    put :update, id: @shopping_list_item, shopping_list_item: { name: @shopping_list_item.name, obligate_id: @shopping_list_item.obligate_id, obligates: @shopping_list_item.obligates, quantity: @shopping_list_item.quantity, shopping_list_id: @shopping_list_item.shopping_list_id, status: @shopping_list_item.status }
    assert_redirected_to shopping_list_item_path(assigns(:shopping_list_item))
  end

  test "should destroy shopping_list_item" do
    assert_difference('ShoppingListItem.count', -1) do
      delete :destroy, id: @shopping_list_item
    end

    assert_redirected_to shopping_list_items_path
  end
end
