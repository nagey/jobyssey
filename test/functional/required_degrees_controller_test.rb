require 'test_helper'

class RequiredDegreesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:required_degrees)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_required_degree
    assert_difference('RequiredDegree.count') do
      post :create, :required_degree => { }
    end

    assert_redirected_to required_degree_path(assigns(:required_degree))
  end

  def test_should_show_required_degree
    get :show, :id => required_degrees(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => required_degrees(:one).id
    assert_response :success
  end

  def test_should_update_required_degree
    put :update, :id => required_degrees(:one).id, :required_degree => { }
    assert_redirected_to required_degree_path(assigns(:required_degree))
  end

  def test_should_destroy_required_degree
    assert_difference('RequiredDegree.count', -1) do
      delete :destroy, :id => required_degrees(:one).id
    end

    assert_redirected_to required_degrees_path
  end
end
