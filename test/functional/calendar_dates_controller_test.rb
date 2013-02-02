require 'test_helper'

class CalendarDatesControllerTest < ActionController::TestCase
  setup do
    @calendar_date = calendar_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calendar_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calendar_date" do
    assert_difference('CalendarDate.count') do
      post :create, calendar_date: { date: @calendar_date.date, exception_type: @calendar_date.exception_type, service_id: @calendar_date.service_id }
    end

    assert_redirected_to calendar_date_path(assigns(:calendar_date))
  end

  test "should show calendar_date" do
    get :show, id: @calendar_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calendar_date
    assert_response :success
  end

  test "should update calendar_date" do
    put :update, id: @calendar_date, calendar_date: { date: @calendar_date.date, exception_type: @calendar_date.exception_type, service_id: @calendar_date.service_id }
    assert_redirected_to calendar_date_path(assigns(:calendar_date))
  end

  test "should destroy calendar_date" do
    assert_difference('CalendarDate.count', -1) do
      delete :destroy, id: @calendar_date
    end

    assert_redirected_to calendar_dates_path
  end
end
