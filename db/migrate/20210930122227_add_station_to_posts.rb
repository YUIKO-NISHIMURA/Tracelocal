class AddStationToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :station, :string
  end
end
