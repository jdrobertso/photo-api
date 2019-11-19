Sequel.migration do
  change do
    create_table(:dummies) do
      primary_key :id
      String :name
      Float :number
    end
  end
end