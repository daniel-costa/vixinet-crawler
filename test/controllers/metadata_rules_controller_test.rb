require 'test_helper'

class MetadataRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metadata_rule = metadata_rules(:one)
  end

  test "should get index" do
    get metadata_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_metadata_rule_url
    assert_response :success
  end

  test "should create metadata_rule" do
    assert_difference('MetadataRule.count') do
      post metadata_rules_url, params: { metadata_rule: { css: @metadata_rule.css, name: @metadata_rule.name, platform_id: @metadata_rule.platform_id, regex: @metadata_rule.regex, xpath: @metadata_rule.xpath } }
    end

    assert_redirected_to metadata_rule_url(MetadataRule.last)
  end

  test "should show metadata_rule" do
    get metadata_rule_url(@metadata_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_metadata_rule_url(@metadata_rule)
    assert_response :success
  end

  test "should update metadata_rule" do
    patch metadata_rule_url(@metadata_rule), params: { metadata_rule: { css: @metadata_rule.css, name: @metadata_rule.name, platform_id: @metadata_rule.platform_id, regex: @metadata_rule.regex, xpath: @metadata_rule.xpath } }
    assert_redirected_to metadata_rule_url(@metadata_rule)
  end

  test "should destroy metadata_rule" do
    assert_difference('MetadataRule.count', -1) do
      delete metadata_rule_url(@metadata_rule)
    end

    assert_redirected_to metadata_rules_url
  end
end
