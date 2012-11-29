class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentor_name
      t.datetime :date
      t.string :details
      t.integer :issue_id
    end
  end
end
