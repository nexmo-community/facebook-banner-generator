class ChangeRectanglesToBanners < ActiveRecord::Migration[6.0]
  def change
    rename_table :rectangles, :banners
  end
end
