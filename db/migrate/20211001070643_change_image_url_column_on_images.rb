class ChangeImageUrlColumnOnImages < ActiveRecord::Migration[6.1]
  def change
    change_column :images, :image_url, :string, null: false
  end
end
