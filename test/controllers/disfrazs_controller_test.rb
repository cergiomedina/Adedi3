require 'test_helper'

class DisfrazsControllerTest < ActionController::TestCase
  setup do
    @disfraz = disfrazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disfrazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disfraz" do
    assert_difference('Disfraz.count') do
      post :create, disfraz: { CATEGORIA_DISFRAZ: @disfraz.CATEGORIA_DISFRAZ, ID_CATEGORIA: @disfraz.ID_CATEGORIA, ID_DISFRAZ: @disfraz.ID_DISFRAZ, STOCK_DISFRAZ: @disfraz.STOCK_DISFRAZ, STOCK_DISPONIBLE: @disfraz.STOCK_DISPONIBLE }
    end

    assert_redirected_to disfraz_path(assigns(:disfraz))
  end

  test "should show disfraz" do
    get :show, id: @disfraz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disfraz
    assert_response :success
  end

  test "should update disfraz" do
    patch :update, id: @disfraz, disfraz: { CATEGORIA_DISFRAZ: @disfraz.CATEGORIA_DISFRAZ, ID_CATEGORIA: @disfraz.ID_CATEGORIA, ID_DISFRAZ: @disfraz.ID_DISFRAZ, STOCK_DISFRAZ: @disfraz.STOCK_DISFRAZ, STOCK_DISPONIBLE: @disfraz.STOCK_DISPONIBLE }
    assert_redirected_to disfraz_path(assigns(:disfraz))
  end

  test "should destroy disfraz" do
    assert_difference('Disfraz.count', -1) do
      delete :destroy, id: @disfraz
    end

    assert_redirected_to disfrazs_path
  end
end
