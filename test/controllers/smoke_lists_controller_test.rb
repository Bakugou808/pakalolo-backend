require 'test_helper'

class SmokeListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smoke_list = smoke_lists(:one)
  end

  test "should get index" do
    get smoke_lists_url, as: :json
    assert_response :success
  end

  test "should create smoke_list" do
    assert_difference('SmokeList.count') do
      post smoke_lists_url, params: { smoke_list: { description: @smoke_list.description, entry_id: @smoke_list.entry_id, title: @smoke_list.title, user_id: @smoke_list.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show smoke_list" do
    get smoke_list_url(@smoke_list), as: :json
    assert_response :success
  end

  test "should update smoke_list" do
    patch smoke_list_url(@smoke_list), params: { smoke_list: { description: @smoke_list.description, entry_id: @smoke_list.entry_id, title: @smoke_list.title, user_id: @smoke_list.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy smoke_list" do
    assert_difference('SmokeList.count', -1) do
      delete smoke_list_url(@smoke_list), as: :json
    end

    assert_response 204
  end
end
