class CreateQuestionsHashtagsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :questions, :hashtags do |t|
      t.index :question_id
      t.index :hashtag_id
    end
  end
end
