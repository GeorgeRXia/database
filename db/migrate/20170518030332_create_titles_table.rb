class CreateTitlesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :titles do |i|
      i.string :header
    end
  end
end
