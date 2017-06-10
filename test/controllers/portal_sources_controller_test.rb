require 'test_helper'

class PortalSourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portal_source = portal_sources(:one)
  end

  test "should get index" do
    get portal_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_portal_source_url
    assert_response :success
  end

  test "should create portal_source" do
    assert_difference('PortalSource.count') do
      post portal_sources_url, params: { portal_source: { name: @portal_source.name, size: @portal_source.size } }
    end

    assert_redirected_to portal_source_url(PortalSource.last)
  end

  test "should show portal_source" do
    get portal_source_url(@portal_source)
    assert_response :success
  end

  test "should get edit" do
    get edit_portal_source_url(@portal_source)
    assert_response :success
  end

  test "should update portal_source" do
    patch portal_source_url(@portal_source), params: { portal_source: { name: @portal_source.name, size: @portal_source.size } }
    assert_redirected_to portal_source_url(@portal_source)
  end

  test "should destroy portal_source" do
    assert_difference('PortalSource.count', -1) do
      delete portal_source_url(@portal_source)
    end

    assert_redirected_to portal_sources_url
  end
end
