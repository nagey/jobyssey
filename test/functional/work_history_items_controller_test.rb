require 'test_helper'

class WorkHistoryItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:work_history_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_work_history_item
    assert_difference('WorkHistoryItem.count') do
      post :create, :work_history_item => { }
    end

    assert_redirected_to work_history_item_path(assigns(:work_history_item))
  end

  def test_should_show_work_history_item
    get :show, :id => work_history_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => work_history_items(:one).id
    assert_response :success
  end

  def test_should_update_work_history_item
    put :update, :id => work_history_items(:one).id, :work_history_item => { }
    assert_redirected_to work_history_item_path(assigns(:work_history_item))
  end

  def test_should_destroy_work_history_item
    assert_difference('WorkHistoryItem.count', -1) do
      delete :destroy, :id => work_history_items(:one).id
    end

    assert_redirected_to work_history_items_path
  end
end
