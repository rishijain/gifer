class CreateGifs < ActiveRecord::Migration[6.1]
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
