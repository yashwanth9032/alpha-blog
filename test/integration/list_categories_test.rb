require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "Programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), test: @category.name
    assert_select "a[href=?]", category_path(@category2), test: @category2.name
  end


end