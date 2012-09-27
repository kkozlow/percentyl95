require 'test_helper'

class RoclientsControllerTest < ActionController::TestCase
  setup do
    @roclient = roclients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roclients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roclient" do
    assert_difference('Roclient.count') do
      post :create, roclient: @roclient.attributes
    end

    assert_redirected_to roclient_path(assigns(:roclient))
  end

  test "should show roclient" do
    get :show, id: @roclient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roclient.to_param
    assert_response :success
  end

  test "should update roclient" do
    put :update, id: @roclient.to_param, roclient: @roclient.attributes
    assert_redirected_to roclient_path(assigns(:roclient))
  end

  test "should destroy roclient" do
    assert_difference('Roclient.count', -1) do
      delete :destroy, id: @roclient.to_param
    end

    assert_redirected_to roclients_path
  end
end
