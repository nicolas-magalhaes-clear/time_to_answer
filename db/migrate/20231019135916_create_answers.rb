class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text :description, null: false
      t.boolean :correct, default:false

      t.timestamps
    end
  end
end
