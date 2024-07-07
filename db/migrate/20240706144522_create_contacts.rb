# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf, index: { unique: true }
      t.string :phone
      t.string :address
      t.string :zipcode
      t.string :geolocation
      t.references :users, :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
