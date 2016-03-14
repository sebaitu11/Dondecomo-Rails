json.array!(@platos) do |plato|
  json.extract! plato, :id
  json.name plato.name
  json.description plato.description
  json.price plato.price
end
