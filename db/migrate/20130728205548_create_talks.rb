class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :room
      t.string :speaker
      t.text :description

      t.timestamps
    end
  end
end
