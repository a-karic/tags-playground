# frozen_string_literal: true

require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get links_new_url
    assert_response :success
  end

  test 'should get edit' do
    get links_edit_url
    assert_response :success
  end

  test 'should get update' do
    get links_update_url
    assert_response :success
  end

  test 'should get create' do
    get links_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get links_destroy_url
    assert_response :success
  end
end
