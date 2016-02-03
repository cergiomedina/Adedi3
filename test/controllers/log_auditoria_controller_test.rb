require 'test_helper'

class LogAuditoriaControllerTest < ActionController::TestCase
  setup do
    @log_auditorium = log_auditoria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:log_auditoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log_auditorium" do
    assert_difference('LogAuditorium.count') do
      post :create, log_auditorium: {  }
    end

    assert_redirected_to log_auditorium_path(assigns(:log_auditorium))
  end

  test "should show log_auditorium" do
    get :show, id: @log_auditorium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log_auditorium
    assert_response :success
  end

  test "should update log_auditorium" do
    patch :update, id: @log_auditorium, log_auditorium: {  }
    assert_redirected_to log_auditorium_path(assigns(:log_auditorium))
  end

  test "should destroy log_auditorium" do
    assert_difference('LogAuditorium.count', -1) do
      delete :destroy, id: @log_auditorium
    end

    assert_redirected_to log_auditoria_path
  end
end
