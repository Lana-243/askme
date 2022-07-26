class AddIndexToHashtags < ActiveRecord::Migration[7.0]
  def change
    add_index :hashtags, :text, unique: true
  end
end
