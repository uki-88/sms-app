class AddEndTimeToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :end_time, :datetime
  end
end
