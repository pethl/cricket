require 'test_helper'

class MatchteamsControllerTest < ActionController::TestCase
  setup do
    @matchteam = matchteams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchteams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchteam" do
    assert_difference('Matchteam.count') do
      post :create, matchteam: { batting_order: @matchteam.batting_order, match_id: @matchteam.match_id, out: @matchteam.out, player_id: @matchteam.player_id }
    end

    assert_redirected_to matchteam_path(assigns(:matchteam))
  end

  test "should show matchteam" do
    get :show, id: @matchteam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchteam
    assert_response :success
  end

  test "should update matchteam" do
    patch :update, id: @matchteam, matchteam: { batting_order: @matchteam.batting_order, match_id: @matchteam.match_id, out: @matchteam.out, player_id: @matchteam.player_id }
    assert_redirected_to matchteam_path(assigns(:matchteam))
  end

  test "should destroy matchteam" do
    assert_difference('Matchteam.count', -1) do
      delete :destroy, id: @matchteam
    end

    assert_redirected_to matchteams_path
  end
end
