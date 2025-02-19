class AddDetailsToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :category, :integer
    add_index :posts, :category
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
    add_column :posts, :published_at, :datetime
  end
end
