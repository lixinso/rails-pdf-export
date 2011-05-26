require 'test_helper'

class PdfsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf" do
    assert_difference('Pdf.count') do
      post :create, :pdf => { }
    end

    assert_redirected_to pdf_path(assigns(:pdf))
  end

  test "should show pdf" do
    get :show, :id => pdfs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pdfs(:one).to_param
    assert_response :success
  end

  test "should update pdf" do
    put :update, :id => pdfs(:one).to_param, :pdf => { }
    assert_redirected_to pdf_path(assigns(:pdf))
  end

  test "should destroy pdf" do
    assert_difference('Pdf.count', -1) do
      delete :destroy, :id => pdfs(:one).to_param
    end

    assert_redirected_to pdfs_path
  end
end
