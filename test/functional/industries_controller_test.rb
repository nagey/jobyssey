require 'test_helper'

class IndustriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:industries)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_industry
    assert_difference('Industry.count') do
      post :create, :industry => { }
    end

    assert_redirected_to industry_path(assigns(:industry))
  end

  def test_should_show_industry
    get :show, :id => industries(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => industries(:one).id
    assert_response :success
  end

  def test_should_update_industry
    put :update, :id => industries(:one).id, :industry => { }
    assert_redirected_to industry_path(assigns(:industry))
  end

  def test_should_destroy_industry
    assert_difference('Industry.count', -1) do
      delete :destroy, :id => industries(:one).id
    end

    assert_redirected_to industries_path
  end
end
