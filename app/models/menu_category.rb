class MenuCategory < ApplicationRecord
  has_many :menu_items

  validates :name, presence: true

  def self.get_menu
    MenuCategory.all.map { |menu| menu }
  end

  def self.get_name
    MenuCategory.pluck(:name, :id)
  end

  def self.get_menu_names
    MenuCategory.where("active", true).all.map { |menu| menu }
  end

  # def self.deactive
  #   where(active: false)
  # end

  # def self.active
  #   where(active: true)
  # end

  # def self.status(active)
  #   if active == true
  #     active
  #   else
  #     deactive
  #   end
  # end
end
