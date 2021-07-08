class MenuCategory < ApplicationRecord
  has_many :menu_items

  def self.get_menu_names
    MenuCategory.all.map { |menu| menu }
  end
end
