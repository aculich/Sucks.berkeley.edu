class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :issue_name
      t.string :commentor_name
      t.datetime :date
      t.string :details

      t.timestamps
    end
  end
end
