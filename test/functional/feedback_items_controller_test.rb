require 'test_helper'

class FeedbackItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_feedback_item
    assert_difference('FeedbackItem.count') do
      post :create, :feedback_item => { }
    end

    assert_redirected_to feedback_item_path(assigns(:feedback_item))
  end

  def test_should_show_feedback_item
    get :show, :id => feedback_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => feedback_items(:one).id
    assert_response :success
  end

  def test_should_update_feedback_item
    put :update, :id => feedback_items(:one).id, :feedback_item => { }
    assert_redirected_to feedback_item_path(assigns(:feedback_item))
  end

  def test_should_destroy_feedback_item
    assert_difference('FeedbackItem.count', -1) do
      delete :destroy, :id => feedback_items(:one).id
    end

    assert_redirected_to feedback_items_path
  end
end
