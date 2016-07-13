require 'test_helper'

class OversControllerTest < ActionController::TestCase
  setup do
    @over = overs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:overs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create over" do
    assert_difference('Over.count') do
      post :create, over: { match_id: @over.match_id, number: @over.number }
    end

    assert_redirected_to over_path(assigns(:over))
  end

  test "should show over" do
    get :show, id: @over
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @over
    assert_response :success
  end

  test "should update over" do
    patch :update, id: @over, over: { match_id: @over.match_id, number: @over.number }
    assert_redirected_to over_path(assigns(:over))
  end

  test "should destroy over" do
    assert_difference('Over.count', -1) do
      delete :destroy, id: @over
    end

    assert_redirected_to overs_path
  end
end
