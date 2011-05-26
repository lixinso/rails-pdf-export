require 'test_helper'

class ResolutionReportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resolution_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resolution_report" do
    assert_difference('ResolutionReport.count') do
      post :create, :resolution_report => { }
    end

    assert_redirected_to resolution_report_path(assigns(:resolution_report))
  end

  test "should show resolution_report" do
    get :show, :id => resolution_reports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => resolution_reports(:one).to_param
    assert_response :success
  end

  test "should update resolution_report" do
    put :update, :id => resolution_reports(:one).to_param, :resolution_report => { }
    assert_redirected_to resolution_report_path(assigns(:resolution_report))
  end

  test "should destroy resolution_report" do
    assert_difference('ResolutionReport.count', -1) do
      delete :destroy, :id => resolution_reports(:one).to_param
    end

    assert_redirected_to resolution_reports_path
  end
end
