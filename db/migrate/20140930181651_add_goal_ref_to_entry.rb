class AddGoalRefToEntry < ActiveRecord::Migration
  def change
  	add_reference :entries, :goal, index: true
  end
end
