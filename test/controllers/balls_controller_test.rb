require 'test_helper'

class BallsControllerTest < ActionController::TestCase
  setup do
    @ball = balls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:balls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ball" do
    assert_difference('Ball.count') do
      post :create, ball: { batsman: @ball.batsman, bowler: @ball.bowler, catcher: @ball.catcher, declared: @ball.declared, delivery: @ball.delivery, done: @ball.done, four: @ball.four, match_id: @ball.match_id, out: @ball.out, over_id: @ball.over_id, runs: @ball.runs, six: @ball.six, wicket: @ball.wicket }
    end

    assert_redirected_to ball_path(assigns(:ball))
  end

  test "should show ball" do
    get :show, id: @ball
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ball
    assert_response :success
  end

  test "should update ball" do
    patch :update, id: @ball, ball: { batsman: @ball.batsman, bowler: @ball.bowler, catcher: @ball.catcher, declared: @ball.declared, delivery: @ball.delivery, done: @ball.done, four: @ball.four, match_id: @ball.match_id, out: @ball.out, over_id: @ball.over_id, runs: @ball.runs, six: @ball.six, wicket: @ball.wicket }
    assert_redirected_to ball_path(assigns(:ball))
  end

  test "should destroy ball" do
    assert_difference('Ball.count', -1) do
      delete :destroy, id: @ball
    end

    assert_redirected_to balls_path
  end
end
