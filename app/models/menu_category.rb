class MenuCategory < ApplicationRecord
  has_many :menu_items
  attr_reader :menu_categories

  def self.get_menu_names
    menu_categories = MenuCategory.all.map { |menu| menu.id }
  end
end
