require 'test_helper'

class TransicionEstVendedorsControllerTest < ActionController::TestCase
  setup do
    @transicion_est_vendedor = transicion_est_vendedors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_est_vendedors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_est_vendedor" do
    assert_difference('TransicionEstVendedor.count') do
      post :create, transicion_est_vendedor: {  }
    end

    assert_redirected_to transicion_est_vendedor_path(assigns(:transicion_est_vendedor))
  end

  test "should show transicion_est_vendedor" do
    get :show, id: @transicion_est_vendedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_est_vendedor
    assert_response :success
  end

  test "should update transicion_est_vendedor" do
    patch :update, id: @transicion_est_vendedor, transicion_est_vendedor: {  }
    assert_redirected_to transicion_est_vendedor_path(assigns(:transicion_est_vendedor))
  end

  test "should destroy transicion_est_vendedor" do
    assert_difference('TransicionEstVendedor.count', -1) do
      delete :destroy, id: @transicion_est_vendedor
    end

    assert_redirected_to transicion_est_vendedors_path
  end
end
