require 'test_helper'

class CartasControllerTest < ActionController::TestCase
  setup do
    @carta = cartas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cartas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carta" do
    assert_difference('Carta.count') do
      post :create, carta: {  }
    end

    assert_redirected_to carta_path(assigns(:carta))
  end

  test "should show carta" do
    get :show, id: @carta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carta
    assert_response :success
  end

  test "should update carta" do
    patch :update, id: @carta, carta: {  }
    assert_redirected_to carta_path(assigns(:carta))
  end

  test "should destroy carta" do
    assert_difference('Carta.count', -1) do
      delete :destroy, id: @carta
    end

    assert_redirected_to cartas_path
  end
end
