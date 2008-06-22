require 'test_helper'

class BenefitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:benefits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_benefit
    assert_difference('Benefit.count') do
      post :create, :benefit => { }
    end

    assert_redirected_to benefit_path(assigns(:benefit))
  end

  def test_should_show_benefit
    get :show, :id => benefits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => benefits(:one).id
    assert_response :success
  end

  def test_should_update_benefit
    put :update, :id => benefits(:one).id, :benefit => { }
    assert_redirected_to benefit_path(assigns(:benefit))
  end

  def test_should_destroy_benefit
    assert_difference('Benefit.count', -1) do
      delete :destroy, :id => benefits(:one).id
    end

    assert_redirected_to benefits_path
  end
end
