require 'test_helper'

class FareAttributesControllerTest < ActionController::TestCase
  setup do
    @fare_attribute = fare_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fare_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fare_attribute" do
    assert_difference('FareAttribute.count') do
      post :create, fare_attribute: { currency_type: @fare_attribute.currency_type, fare_id: @fare_attribute.fare_id, payment_method: @fare_attribute.payment_method, price: @fare_attribute.price, transfer_duration: @fare_attribute.transfer_duration, transfers: @fare_attribute.transfers }
    end

    assert_redirected_to fare_attribute_path(assigns(:fare_attribute))
  end

  test "should show fare_attribute" do
    get :show, id: @fare_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fare_attribute
    assert_response :success
  end

  test "should update fare_attribute" do
    put :update, id: @fare_attribute, fare_attribute: { currency_type: @fare_attribute.currency_type, fare_id: @fare_attribute.fare_id, payment_method: @fare_attribute.payment_method, price: @fare_attribute.price, transfer_duration: @fare_attribute.transfer_duration, transfers: @fare_attribute.transfers }
    assert_redirected_to fare_attribute_path(assigns(:fare_attribute))
  end

  test "should destroy fare_attribute" do
    assert_difference('FareAttribute.count', -1) do
      delete :destroy, id: @fare_attribute
    end

    assert_redirected_to fare_attributes_path
  end
end
