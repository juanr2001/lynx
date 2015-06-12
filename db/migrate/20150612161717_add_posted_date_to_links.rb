class AddPostedDateToLinks < ActiveRecord::Migration
  def change
    add_column :links, :posted_at, :datetime
  end
end
