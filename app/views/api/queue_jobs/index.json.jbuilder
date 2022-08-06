json.page @page
json.per_page @per_page
json.total @jobs.size
json.total_per_page

json.set! :records do
  json.array! @jobs do |job|
    json.call(job, :id, :status)
  end
end
