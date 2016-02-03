require 'test_helper'

class NotaDeVentaControllerTest < ActionController::TestCase
  setup do
    @nota_de_ventum = nota_de_venta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nota_de_venta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nota_de_ventum" do
    assert_difference('NotaDeVentum.count') do
      post :create, nota_de_ventum: {  }
    end

    assert_redirected_to nota_de_ventum_path(assigns(:nota_de_ventum))
  end

  test "should show nota_de_ventum" do
    get :show, id: @nota_de_ventum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nota_de_ventum
    assert_response :success
  end

  test "should update nota_de_ventum" do
    patch :update, id: @nota_de_ventum, nota_de_ventum: {  }
    assert_redirected_to nota_de_ventum_path(assigns(:nota_de_ventum))
  end

  test "should destroy nota_de_ventum" do
    assert_difference('NotaDeVentum.count', -1) do
      delete :destroy, id: @nota_de_ventum
    end

    assert_redirected_to nota_de_venta_path
  end
end
