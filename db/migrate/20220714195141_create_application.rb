class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false
      t.text :applicant_bio
      t.string :application_status, default: 'In Progress'

      t.timestamps
    end
  end
end
