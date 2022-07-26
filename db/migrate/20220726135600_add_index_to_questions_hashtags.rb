class AddIndexToQuestionsHashtags < ActiveRecord::Migration[7.0]
  def change
    add_index :hashtags_questions, [ :question_id, :hashtag_id ], :unique => true, :name => 'by_question_and_hashtag'
  end
end
