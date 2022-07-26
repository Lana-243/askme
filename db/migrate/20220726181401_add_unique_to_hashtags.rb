class AddUniqueToHashtags < ActiveRecord::Migration[7.0]
  def change
    change_column :hashtags, :text, :string, unique: true
  end
end
