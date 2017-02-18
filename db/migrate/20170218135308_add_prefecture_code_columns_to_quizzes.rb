class AddPrefectureCodeColumnsToQuizzes < ActiveRecord::Migration[5.0]
  def change
    add_column :quizzes, :prefecture_code, :integer
  end
end
