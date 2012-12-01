class CreateDaterecords < ActiveRecord::Migration
  def change
    create_table :daterecords do |t|
      t.string :name
      t.datetime :dt
    end
  end
end