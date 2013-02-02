require 'test_helper'

class AgenciesControllerTest < ActionController::TestCase
  setup do
    @agency = agencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agency" do
    assert_difference('Agency.count') do
      post :create, agency: { agency_id: @agency.agency_id, agency_lang: @agency.agency_lang, agency_name: @agency.agency_name, agency_phone: @agency.agency_phone, agency_timezone: @agency.agency_timezone, agency_url: @agency.agency_url }
    end

    assert_redirected_to agency_path(assigns(:agency))
  end

  test "should show agency" do
    get :show, id: @agency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agency
    assert_response :success
  end

  test "should update agency" do
    put :update, id: @agency, agency: { agency_id: @agency.agency_id, agency_lang: @agency.agency_lang, agency_name: @agency.agency_name, agency_phone: @agency.agency_phone, agency_timezone: @agency.agency_timezone, agency_url: @agency.agency_url }
    assert_redirected_to agency_path(assigns(:agency))
  end

  test "should destroy agency" do
    assert_difference('Agency.count', -1) do
      delete :destroy, id: @agency
    end

    assert_redirected_to agencies_path
  end
end
