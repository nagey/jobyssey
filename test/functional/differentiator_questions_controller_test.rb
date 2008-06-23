require 'test_helper'

class DifferentiatorQuestionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:differentiator_questions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_differentiator_question
    assert_difference('DifferentiatorQuestion.count') do
      post :create, :differentiator_question => { }
    end

    assert_redirected_to differentiator_question_path(assigns(:differentiator_question))
  end

  def test_should_show_differentiator_question
    get :show, :id => differentiator_questions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => differentiator_questions(:one).id
    assert_response :success
  end

  def test_should_update_differentiator_question
    put :update, :id => differentiator_questions(:one).id, :differentiator_question => { }
    assert_redirected_to differentiator_question_path(assigns(:differentiator_question))
  end

  def test_should_destroy_differentiator_question
    assert_difference('DifferentiatorQuestion.count', -1) do
      delete :destroy, :id => differentiator_questions(:one).id
    end

    assert_redirected_to differentiator_questions_path
  end
end
