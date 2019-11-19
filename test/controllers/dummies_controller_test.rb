require 'test_helper'

class DummiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dummy = dummies(:one)
  end

  test "should get index" do
    get dummies_url, as: :json
    assert_response :success
  end

  test "should create dummy" do
    assert_difference('Dummy.count') do
      post dummies_url, params: { dummy: { name: @dummy.name, number: @dummy.number } }, as: :json
    end

    assert_response 201
  end

  test "should show dummy" do
    get dummy_url(@dummy), as: :json
    assert_response :success
  end

  test "should update dummy" do
    patch dummy_url(@dummy), params: { dummy: { name: @dummy.name, number: @dummy.number } }, as: :json
    assert_response 200
  end

  test "should destroy dummy" do
    assert_difference('Dummy.count', -1) do
      delete dummy_url(@dummy), as: :json
    end

    assert_response 204
  end
end
