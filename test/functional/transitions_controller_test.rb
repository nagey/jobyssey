require 'test_helper'

class TransitionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:transitions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_transition
    assert_difference('Transition.count') do
      post :create, :transition => { }
    end

    assert_redirected_to transition_path(assigns(:transition))
  end

  def test_should_show_transition
    get :show, :id => transitions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => transitions(:one).id
    assert_response :success
  end

  def test_should_update_transition
    put :update, :id => transitions(:one).id, :transition => { }
    assert_redirected_to transition_path(assigns(:transition))
  end

  def test_should_destroy_transition
    assert_difference('Transition.count', -1) do
      delete :destroy, :id => transitions(:one).id
    end

    assert_redirected_to transitions_path
  end
end
