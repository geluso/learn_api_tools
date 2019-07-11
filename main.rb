require "pry"
require 'json'

curl = <<~CURL
curl 'https://learn.co/api/v1/assignments/admin/assignments/search' -H 'Origin: https://learn.co' -H 'Accept-Encoding: gzip, deflate, br' -H 'X-CSRF-TOKEN: RiMrP6oIsrqCRdmRBZHFDvPIj5xQ83vYhvuTSxqx51TjfiN38aLbUZ7IqJv3OAl2gJ4/PYcqez/H75f4iCEK4w==' -H 'Accept-Language: en-US,en;q=0.9' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'Content-Type: application/json;charset=UTF-8' -H 'Accept: application/json, text/plain, */*' -H 'Referer: https://learn.co/admin/assignments/search/assignments' -H 'Cookie: ajs_user_id=%228950ef97-5df7-4898-a73e-3c4eddaa9983%22; ajs_group_id=null; ajs_anonymous_id=%2273d0ae82-868e-44a2-a1d1-eb84115e4c10%22; _ga=GA1.2.7603826.1562804968; _gid=GA1.2.1715219889.1562804968; seg_xid=28ab2eca-ac63-43c0-9225-5b505138bf63; seg_xid_fd=learn.co; seg_xid_ts=1562804967598; hubspotutk=dbf9beabe7dd4d5765235492c74031c4; __hssrc=1; _fbp=fb.1.1562804968947.9911806; intercom-id-j4d6dyie=6fe153e2-36e5-45ec-ab14-fcfc1b4051da; __hstc=112149531.dbf9beabe7dd4d5765235492c74031c4.1562804968268.1562804968268.1562807185004.2; __hssc=112149531.3.1562807185004; _feyonce_session=QWpMUi9tTUpPZlBKNlRnemFBK0lUeWkrVEhBdkJoa0RNUDVYRjUyMTRxb29XZFJDd2tmMTd2MXVuc2IwS00xM3JkYXA3ZXNPT0VKakpoakRlSWhyZ1RqN09WUDFDTVBQY0F3YVhlNnAzV1FwVkZiU1dMcVNkT1JPSHE2THQzSGtoTmtVZ2dabWpKNENQL1M2Mk5Dc3VCNjZjaWJvMXlmUm5NQUk1SitmK3VrOTA4eVU5dGVVNFpHUEZtVU5laGpDRDFiczhMalozOVVtckdqVVExZWg2OE9Ca1haLzcvc1hJQUh5WEkxckpWZkpWTEFaYmRhNGJDZE5uTjcvZm8zZHUzTnZZOU9OUWVrdm1EOWRTUXVEK3E2WDNObDltOUtzcDZsWm5NSU9VVWtrQ1YraFVqS2xJVGpYVDZ3em1OeWdOcGVxaHFuZlBFRU56QVJaYW5FUGllVUtMSnJZcURzaTVSL1F4amVDaVNnPS0tSTdjSmNSQlZLUE5VRG1INTg1NE40QT09--88d916ec94a23c7c81ef003e413e4140be39e0ec' -H 'Connection: keep-alive' --data-binary '{"assignment_title":"","collaborator_ids":[],"published":false,"draft":false,"ended":false}' --compressed
CURL

response = `#{curl}`
json = JSON.parse(response)
count = json["assignments_count"]
assignments = json["user_assignments"]
seattle = assignments.filter do |assignment|
  assignment["title"].include? "seattle"
end 

seattle.reverse!

seattle.each do |assignment|
  puts assignment["title"]
  puts "https://learn.co/admin/assignments/#{assignment['id']}"
  puts
end
