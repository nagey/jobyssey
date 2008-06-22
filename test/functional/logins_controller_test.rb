require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:logins)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_login
    assert_difference('Login.count') do
      post :create, :login => { }
    end

    assert_redirected_to login_path(assigns(:login))
  end

  def test_should_show_login
    get :show, :id => logins(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => logins(:one).id
    assert_response :success
  end

  def test_should_update_login
    put :update, :id => logins(:one).id, :login => { }
    assert_redirected_to login_path(assigns(:login))
  end

  def test_should_destroy_login
    assert_difference('Login.count', -1) do
      delete :destroy, :id => logins(:one).id
    end

    assert_redirected_to logins_path
  end
end
