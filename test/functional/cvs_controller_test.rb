require 'test_helper'

class CvsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:cvs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_cv
    assert_difference('Cv.count') do
      post :create, :cv => { }
    end

    assert_redirected_to cv_path(assigns(:cv))
  end

  def test_should_show_cv
    get :show, :id => cvs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => cvs(:one).id
    assert_response :success
  end

  def test_should_update_cv
    put :update, :id => cvs(:one).id, :cv => { }
    assert_redirected_to cv_path(assigns(:cv))
  end

  def test_should_destroy_cv
    assert_difference('Cv.count', -1) do
      delete :destroy, :id => cvs(:one).id
    end

    assert_redirected_to cvs_path
  end
end
