require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:melissa)
  end 

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: categories(:one).category
    click_on "Create Category"

    assert_text "Category was successfully created"
  end

  test "updating a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: categories(:one).category
    click_on "Create Category"
    assert_text "Category was successfully created"
    
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: categories(:two).category
    click_on "Update Category"

    assert_text "Category was successfully updated"
  end

  test "destroying a Category" do
    visit categories_url
    click_on "New Category"

    fill_in "Category", with: categories(:one).category
    click_on "Create Category"
    assert_text "Category was successfully created"

    visit categories_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Category was successfully destroyed"
  end
end
