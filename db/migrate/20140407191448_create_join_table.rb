class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table :lines_stations do |t|
      t.belongs_to :line
      t.belongs_to :station
    end
  end
end
