json.array!(@patients) do |patient|
  json.extract! patient, :Name, :Contact, :Email, :Address
  json.url patient_url(patient, format: :json)
end
