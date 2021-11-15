class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.integer :user_id, null: false
      t.integer :time, null: false

      t.timestamps
    end
  end
end
