class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :quizzes, :prefecture, :integer
  end
end
