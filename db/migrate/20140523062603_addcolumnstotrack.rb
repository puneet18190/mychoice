class Addcolumnstotrack < ActiveRecord::Migration
  def change
    add_column :tracks, :combined_truncated, :string
    add_column :tracks, :large_img, :string
    add_column :tracks, :medium_img, :string
    add_column :tracks, :small_img, :string
    add_column :tracks, :via, :string
    add_column :tracks, :via_url, :string
    add_column :tracks, :background, :string
  end
end
