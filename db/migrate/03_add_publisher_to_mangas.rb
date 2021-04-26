class AddPublisherToMangas < ActiveRecord::Migration[5.2]
    def change
        add_column :mangas, :publisher, :string
    end
end