class RenameColumnInChapter < ActiveRecord::Migration[7.1]
  def change
    rename_column :chapters, :video, :video_id
  end
end
