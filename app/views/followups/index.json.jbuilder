json.array!(@followups) do |followup|
  json.extract! followup, :Date, :ClinicalPicture, :Plan
  json.url followup_url(followup, format: :json)
end
