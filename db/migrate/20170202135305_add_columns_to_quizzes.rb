class AddColumnsToQuizzes < ActiveRecord::Migration[5.0]
  def change
    rename_column :quizzes, :hint, :description
    add_column    :quizzes, :hint, :integer, default: 1
  end
end
