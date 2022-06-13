require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  test "visiting the index" do
    sign_in users(:melissa)
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    sign_in users(:melissa)
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: "Hello Text"
    click_on "Create Category"

    assert_text "Category was successfully created"
  end

  test "updating a Category" do
    sign_in users(:melissa)
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: "Hello Text"
    click_on "Create Category"
    assert_text "Category was successfully created"
    
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: "Hello Test"
    click_on "Update Category"

    assert_text "Category was successfully updated"
  end

  test "destroying a Category" do
    sign_in users(:melissa)
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: "Hello Text"
    click_on "Create Category"
    assert_text "Category was successfully created"

    visit categories_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Category was successfully destroyed"
  end
end
