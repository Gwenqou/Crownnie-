require 'test_helper'

class ServiceMenusControllerTest < ActionController::TestCase
  setup do
    @service_menu = service_menus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_menu" do
    assert_difference('ServiceMenu.count') do
      post :create, service_menu: { menu: @service_menu.menu, user_id: @service_menu.user_id }
    end

    assert_redirected_to service_menu_path(assigns(:service_menu))
  end

  test "should show service_menu" do
    get :show, id: @service_menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_menu
    assert_response :success
  end

  test "should update service_menu" do
    patch :update, id: @service_menu, service_menu: { menu: @service_menu.menu, user_id: @service_menu.user_id }
    assert_redirected_to service_menu_path(assigns(:service_menu))
  end

  test "should destroy service_menu" do
    assert_difference('ServiceMenu.count', -1) do
      delete :destroy, id: @service_menu
    end

    assert_redirected_to service_menus_path
  end
end
