require 'test_helper'

class ShapesControllerTest < ActionController::TestCase
  setup do
    @shape = shapes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shape" do
    assert_difference('Shape.count') do
      post :create, shape: { shape_dist_traveled: @shape.shape_dist_traveled, shape_id: @shape.shape_id, shape_pt_lat: @shape.shape_pt_lat, shape_pt_lon: @shape.shape_pt_lon, shape_pt_sequence: @shape.shape_pt_sequence }
    end

    assert_redirected_to shape_path(assigns(:shape))
  end

  test "should show shape" do
    get :show, id: @shape
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shape
    assert_response :success
  end

  test "should update shape" do
    put :update, id: @shape, shape: { shape_dist_traveled: @shape.shape_dist_traveled, shape_id: @shape.shape_id, shape_pt_lat: @shape.shape_pt_lat, shape_pt_lon: @shape.shape_pt_lon, shape_pt_sequence: @shape.shape_pt_sequence }
    assert_redirected_to shape_path(assigns(:shape))
  end

  test "should destroy shape" do
    assert_difference('Shape.count', -1) do
      delete :destroy, id: @shape
    end

    assert_redirected_to shapes_path
  end
end
