require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "valid category" do
    category = Category.new(category: 'Life')
    category.valid?
    assert_empty category.errors[:category]
  end

  test "invalid if category is empty" do
    category = Category.new(category: '')
    assert_not category.valid?
  end

  test "invalid if category already exists" do
    category = categories(:one)
    category_two = categories(:two)
    category.category = category_two.category
    assert_not category.valid?
  end
end
