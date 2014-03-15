require 'test_helper'

class StitchesControllerTest < ActionController::TestCase
  setup do
    @stitch = stitches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stitches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stitch" do
    assert_difference('Stitch.count') do
      post :create, stitch: { color: @stitch.color, position: @stitch.position, type: @stitch.type }
    end

    assert_redirected_to stitch_path(assigns(:stitch))
  end

  test "should show stitch" do
    get :show, id: @stitch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stitch
    assert_response :success
  end

  test "should update stitch" do
    put :update, id: @stitch, stitch: { color: @stitch.color, position: @stitch.position, type: @stitch.type }
    assert_redirected_to stitch_path(assigns(:stitch))
  end

  test "should destroy stitch" do
    assert_difference('Stitch.count', -1) do
      delete :destroy, id: @stitch
    end

    assert_redirected_to stitches_path
  end
end
