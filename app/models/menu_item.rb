class MenuItem < ApplicationRecord
  belongs_to :menu_category

  def self.get_items(id)
    where("menu_category_id = ?", id)
  end
end
