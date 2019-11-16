class AddPostIdToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :post_id, :integer
    add_index  :tags, :post_id
  end
end
