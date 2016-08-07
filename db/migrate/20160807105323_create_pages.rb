class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages, id: :uuid do |t|
      t.string :url
      t.json :content

      t.timestamps null: false
    end
  end
end
