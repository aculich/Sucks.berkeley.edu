class CreateUservoiceTickets < ActiveRecord::Migration
  def change
    create_table :uservoice_tickets do |t|
      t.text :body
      t.string :subject
      t.string :uservoice_id
      t.string :uservoice_auther_karma
      t.string :ticket_number
      t.string :url

    end
  end
end
