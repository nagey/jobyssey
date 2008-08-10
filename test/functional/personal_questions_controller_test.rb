require 'test_helper'

class PersonalQuestionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_questions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_personal_question
    assert_difference('PersonalQuestion.count') do
      post :create, :personal_question => { }
    end

    assert_redirected_to personal_question_path(assigns(:personal_question))
  end

  def test_should_show_personal_question
    get :show, :id => personal_questions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => personal_questions(:one).id
    assert_response :success
  end

  def test_should_update_personal_question
    put :update, :id => personal_questions(:one).id, :personal_question => { }
    assert_redirected_to personal_question_path(assigns(:personal_question))
  end

  def test_should_destroy_personal_question
    assert_difference('PersonalQuestion.count', -1) do
      delete :destroy, :id => personal_questions(:one).id
    end

    assert_redirected_to personal_questions_path
  end
end
