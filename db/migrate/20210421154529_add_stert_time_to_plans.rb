class AddStertTimeToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :start_time, :datetime
  end
end
