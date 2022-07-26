class AddIndexToHashtagsQuestions < ActiveRecord::Migration[7.0]
  def change
    add_index :hashtags_questions, [ :hashtag_id, :question_id ], :unique => true, :name => 'by_hashtag_and_question'
  end
end
