require 'test_helper'

class TransicionEstEjemplarsControllerTest < ActionController::TestCase
  setup do
    @transicion_est_ejemplar = transicion_est_ejemplars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transicion_est_ejemplars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transicion_est_ejemplar" do
    assert_difference('TransicionEstEjemplar.count') do
      post :create, transicion_est_ejemplar: {  }
    end

    assert_redirected_to transicion_est_ejemplar_path(assigns(:transicion_est_ejemplar))
  end

  test "should show transicion_est_ejemplar" do
    get :show, id: @transicion_est_ejemplar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transicion_est_ejemplar
    assert_response :success
  end

  test "should update transicion_est_ejemplar" do
    patch :update, id: @transicion_est_ejemplar, transicion_est_ejemplar: {  }
    assert_redirected_to transicion_est_ejemplar_path(assigns(:transicion_est_ejemplar))
  end

  test "should destroy transicion_est_ejemplar" do
    assert_difference('TransicionEstEjemplar.count', -1) do
      delete :destroy, id: @transicion_est_ejemplar
    end

    assert_redirected_to transicion_est_ejemplars_path
  end
end
