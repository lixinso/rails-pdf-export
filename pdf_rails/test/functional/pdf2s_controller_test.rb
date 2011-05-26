require 'test_helper'

class Pdf2sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdf2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf2" do
    assert_difference('Pdf2.count') do
      post :create, :pdf2 => { }
    end

    assert_redirected_to pdf2_path(assigns(:pdf2))
  end

  test "should show pdf2" do
    get :show, :id => pdf2s(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pdf2s(:one).to_param
    assert_response :success
  end

  test "should update pdf2" do
    put :update, :id => pdf2s(:one).to_param, :pdf2 => { }
    assert_redirected_to pdf2_path(assigns(:pdf2))
  end

  test "should destroy pdf2" do
    assert_difference('Pdf2.count', -1) do
      delete :destroy, :id => pdf2s(:one).to_param
    end

    assert_redirected_to pdf2s_path
  end
end
