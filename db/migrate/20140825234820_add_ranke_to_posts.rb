class AddRankeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rank, :float
  end
end
