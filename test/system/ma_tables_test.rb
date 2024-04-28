require "application_system_test_case"

class MaTablesTest < ApplicationSystemTestCase
  setup do
    @ma_table = ma_tables(:one)
  end

  test "visiting the index" do
    visit ma_tables_url
    assert_selector "h1", text: "Ma tables"
  end

  test "should create ma table" do
    visit ma_tables_url
    click_on "New ma table"

    fill_in "Age", with: @ma_table.age
    fill_in "Description", with: @ma_table.description
    fill_in "Name", with: @ma_table.name
    click_on "Create Ma table"

    assert_text "Ma table was successfully created"
    click_on "Back"
  end

  test "should update Ma table" do
    visit ma_table_url(@ma_table)
    click_on "Edit this ma table", match: :first

    fill_in "Age", with: @ma_table.age
    fill_in "Description", with: @ma_table.description
    fill_in "Name", with: @ma_table.name
    click_on "Update Ma table"

    assert_text "Ma table was successfully updated"
    click_on "Back"
  end

  test "should destroy Ma table" do
    visit ma_table_url(@ma_table)
    click_on "Destroy this ma table", match: :first

    assert_text "Ma table was successfully destroyed"
  end
end
