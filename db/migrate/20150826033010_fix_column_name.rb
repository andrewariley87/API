class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :taggings, :post_id, :note_id
  end
end
