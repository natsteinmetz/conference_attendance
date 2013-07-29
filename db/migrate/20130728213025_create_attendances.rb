class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :talk
      t.belongs_to :attendee
      t.boolean :presenter

      t.timestamps
    end
  end
end
