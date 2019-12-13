Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String :username, :null=>false, :unique=>true
      String :email, :null=>false, :unique=>true
      String :password_digest, :null=>false
    end

    create_table(:albums) do
      primary_key :id
      String :name, :null=>false
      foreign_key :user_id, :users, :null=>false
    end

    create_table(:pictures) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false
      foreign_key :album_id, :albums
      String :name, :null=>false
      String :image_data, :null=>false
    end
  end
end