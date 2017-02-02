class Quizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string  :kanji
      t.string  :kana
      t.string  :prefecture
      t.integer :level
      t.text    :hint
      t.timestamps
    end
  end
end
