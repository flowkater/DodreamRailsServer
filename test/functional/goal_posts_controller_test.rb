require 'test_helper'

class GoalPostsControllerTest < ActionController::TestCase
  setup do
    @goal_post = goal_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_post" do
    assert_difference('GoalPost.count') do
      post :create, goal_post: @goal_post.attributes
    end

    assert_redirected_to goal_post_path(assigns(:goal_post))
  end

  test "should show goal_post" do
    get :show, id: @goal_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_post
    assert_response :success
  end

  test "should update goal_post" do
    put :update, id: @goal_post, goal_post: @goal_post.attributes
    assert_redirected_to goal_post_path(assigns(:goal_post))
  end

  test "should destroy goal_post" do
    assert_difference('GoalPost.count', -1) do
      delete :destroy, id: @goal_post
    end

    assert_redirected_to goal_posts_path
  end
end
