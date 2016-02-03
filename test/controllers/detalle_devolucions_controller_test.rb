require 'test_helper'

class DetalleDevolucionsControllerTest < ActionController::TestCase
  setup do
    @detalle_devolucion = detalle_devolucions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalle_devolucions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle_devolucion" do
    assert_difference('DetalleDevolucion.count') do
      post :create, detalle_devolucion: {  }
    end

    assert_redirected_to detalle_devolucion_path(assigns(:detalle_devolucion))
  end

  test "should show detalle_devolucion" do
    get :show, id: @detalle_devolucion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle_devolucion
    assert_response :success
  end

  test "should update detalle_devolucion" do
    patch :update, id: @detalle_devolucion, detalle_devolucion: {  }
    assert_redirected_to detalle_devolucion_path(assigns(:detalle_devolucion))
  end

  test "should destroy detalle_devolucion" do
    assert_difference('DetalleDevolucion.count', -1) do
      delete :destroy, id: @detalle_devolucion
    end

    assert_redirected_to detalle_devolucions_path
  end
end
