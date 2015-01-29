class AddHopesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hopes_for_mentorship, :text
    add_column :users, :hopes_for_future, :text
  end
end
