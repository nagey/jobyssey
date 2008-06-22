require 'test_helper'

class TownsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:towns)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_town
    assert_difference('Town.count') do
      post :create, :town => { }
    end

    assert_redirected_to town_path(assigns(:town))
  end

  def test_should_show_town
    get :show, :id => towns(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => towns(:one).id
    assert_response :success
  end

  def test_should_update_town
    put :update, :id => towns(:one).id, :town => { }
    assert_redirected_to town_path(assigns(:town))
  end

  def test_should_destroy_town
    assert_difference('Town.count', -1) do
      delete :destroy, :id => towns(:one).id
    end

    assert_redirected_to towns_path
  end
end
