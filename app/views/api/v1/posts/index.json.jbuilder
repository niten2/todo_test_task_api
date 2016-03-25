json.array!(@posts) do |post|
  json.partial! partial: "post", locals: { post: post }
end
