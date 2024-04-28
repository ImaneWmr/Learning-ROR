require "test_helper"

class MaTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ma_table = ma_tables(:one)
  end

  test "should get index" do
    get ma_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_ma_table_url
    assert_response :success
  end

  test "should create ma_table" do
    assert_difference("MaTable.count") do
      post ma_tables_url, params: { ma_table: { age: @ma_table.age, description: @ma_table.description, name: @ma_table.name } }
    end

    assert_redirected_to ma_table_url(MaTable.last)
  end

  test "should show ma_table" do
    get ma_table_url(@ma_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_ma_table_url(@ma_table)
    assert_response :success
  end

  test "should update ma_table" do
    patch ma_table_url(@ma_table), params: { ma_table: { age: @ma_table.age, description: @ma_table.description, name: @ma_table.name } }
    assert_redirected_to ma_table_url(@ma_table)
  end

  test "should destroy ma_table" do
    assert_difference("MaTable.count", -1) do
      delete ma_table_url(@ma_table)
    end

    assert_redirected_to ma_tables_url
  end
end
