require 'test_helper'

class PatternsControllerTest < ActionController::TestCase
  setup do
    @pattern = patterns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patterns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pattern" do
    assert_difference('Pattern.count') do
      post :create, pattern: { description: @pattern.description, difficulty: @pattern.difficulty, equipment: @pattern.equipment, instructions: @pattern.instructions, name: @pattern.name, no_of_rows: @pattern.no_of_rows, notes: @pattern.notes, status: @pattern.status, yarn: @pattern.yarn }
    end

    assert_redirected_to pattern_path(assigns(:pattern))
  end

  test "should show pattern" do
    get :show, id: @pattern
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pattern
    assert_response :success
  end

  test "should update pattern" do
    put :update, id: @pattern, pattern: { description: @pattern.description, difficulty: @pattern.difficulty, equipment: @pattern.equipment, instructions: @pattern.instructions, name: @pattern.name, no_of_rows: @pattern.no_of_rows, notes: @pattern.notes, status: @pattern.status, yarn: @pattern.yarn }
    assert_redirected_to pattern_path(assigns(:pattern))
  end

  test "should destroy pattern" do
    assert_difference('Pattern.count', -1) do
      delete :destroy, id: @pattern
    end

    assert_redirected_to patterns_path
  end
end
