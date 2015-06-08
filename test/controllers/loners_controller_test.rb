require 'test_helper'

class LonersControllerTest < ActionController::TestCase
  setup do
    @loner = loners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loner" do
    assert_difference('Loner.count') do
      post :create, loner: {  }
    end

    assert_redirected_to loner_path(assigns(:loner))
  end

  test "should show loner" do
    get :show, id: @loner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loner
    assert_response :success
  end

  test "should update loner" do
    patch :update, id: @loner, loner: {  }
    assert_redirected_to loner_path(assigns(:loner))
  end

  test "should destroy loner" do
    assert_difference('Loner.count', -1) do
      delete :destroy, id: @loner
    end

    assert_redirected_to loners_path
  end
end
