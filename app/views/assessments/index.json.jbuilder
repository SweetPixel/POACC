json.array!(@assessments) do |assessment|
  json.extract! assessment, :Complaints, :Clinical, :Investigation
  json.url assessment_url(assessment, format: :json)
end
