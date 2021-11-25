class ChangeDataTimeToStudyTime < ActiveRecord::Migration[5.2]
  def change
    change_column :study_times, :time, :float
  end
end
