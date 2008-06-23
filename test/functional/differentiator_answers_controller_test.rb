require 'test_helper'

class DifferentiatorAnswersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:differentiator_answers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_differentiator_answer
    assert_difference('DifferentiatorAnswer.count') do
      post :create, :differentiator_answer => { }
    end

    assert_redirected_to differentiator_answer_path(assigns(:differentiator_answer))
  end

  def test_should_show_differentiator_answer
    get :show, :id => differentiator_answers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => differentiator_answers(:one).id
    assert_response :success
  end

  def test_should_update_differentiator_answer
    put :update, :id => differentiator_answers(:one).id, :differentiator_answer => { }
    assert_redirected_to differentiator_answer_path(assigns(:differentiator_answer))
  end

  def test_should_destroy_differentiator_answer
    assert_difference('DifferentiatorAnswer.count', -1) do
      delete :destroy, :id => differentiator_answers(:one).id
    end

    assert_redirected_to differentiator_answers_path
  end
end
