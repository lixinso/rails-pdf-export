require 'test_helper'

class Pdf3sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdf3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf3" do
    assert_difference('Pdf3.count') do
      post :create, :pdf3 => { }
    end

    assert_redirected_to pdf3_path(assigns(:pdf3))
  end

  test "should show pdf3" do
    get :show, :id => pdf3s(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pdf3s(:one).to_param
    assert_response :success
  end

  test "should update pdf3" do
    put :update, :id => pdf3s(:one).to_param, :pdf3 => { }
    assert_redirected_to pdf3_path(assigns(:pdf3))
  end

  test "should destroy pdf3" do
    assert_difference('Pdf3.count', -1) do
      delete :destroy, :id => pdf3s(:one).to_param
    end

    assert_redirected_to pdf3s_path
  end
end
