require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post :create, route: { agency_id: @route.agency_id, route_color: @route.route_color, route_id: @route.route_id, route_long_name: @route.route_long_name, route_short_name: @route.route_short_name, route_text_color: @route.route_text_color, route_type: @route.route_type, route_url: @route.route_url }
    end

    assert_redirected_to route_path(assigns(:route))
  end

  test "should show route" do
    get :show, id: @route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @route
    assert_response :success
  end

  test "should update route" do
    put :update, id: @route, route: { agency_id: @route.agency_id, route_color: @route.route_color, route_id: @route.route_id, route_long_name: @route.route_long_name, route_short_name: @route.route_short_name, route_text_color: @route.route_text_color, route_type: @route.route_type, route_url: @route.route_url }
    assert_redirected_to route_path(assigns(:route))
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete :destroy, id: @route
    end

    assert_redirected_to routes_path
  end
end
