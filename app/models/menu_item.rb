class MenuItem < ApplicationRecord
  has_one_attached :item_image
  belongs_to :menu_category
  validates :name, :description, :price, presence: true
  validate :acceptable_image

  def self.get_items(id)
    where("menu_category_id = ?", id)
  end

  def self.get_item_names(id)
    where("menu_category_id = ?", id).pluck(:name, :id)
  end

  def self.get_item_values(menu_id)
    where("id = ?", menu_id).pluck(:name, :description, :price)
  end

  def acceptable_image
    return unless item_image.attached?

    unless item_image.byte_size <= 2.megabyte
      errors.add(:item_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(item_image.content_type)
      errors.add(:item_image, "must be a JPEG or PNG")
    end
  end
end
