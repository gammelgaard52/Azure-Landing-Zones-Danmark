# Parameters
$root = 'netdesigndemo.risma.dk'
$body = @'
{"username":"maras",
 "password":"cSDa2pSjuWCeVj6"
}
'@

# Authenticate
$action = 'login'
$restUri = ('https://{root}/api/2.0/{action}/').replace('{root}',$root).Replace('{action}',$action)
$method = 'POST'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -SessionVariable session
#$response.Headers.Values[6] | ConvertFrom-Json

# Validate current token
$action = 'login'
$restUri = ('https://{root}/api/2.0/{action}/').replace('{root}',$root).Replace('{action}',$action)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$response.Content | ConvertFrom-Json


#curl -X GET "https://netdesigndemo.risma.dk/api/2.0/compliance/informationAssets" -H "accept: application/json"
# Get information assets
$action = 'compliance/informationAssets'
$restUri = ('https://{root}/api/2.0/{action}/').replace('{root}',$root).Replace('{action}',$action)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$1 = $response | ConvertFrom-Json
$1.list | Format-Table

#curl -X GET "https://netdesigndemo.risma.dk/api/2.0/compliance/informationAssets/processors/4" -H "accept: application/json"
# Get processor details
$action = 'compliance/informationAssets'
$action2 = 'processors/4'
$restUri = ('https://{root}/api/2.0/{action}/{action2}').replace('{root}',$root).Replace('{action}',$action).Replace('{action2}',$action2)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$1 = $response | ConvertFrom-Json
$1 | Format-List
$1.questionnaire
$1.questionnaires

#curl -X GET "https://netdesigndemo.risma.dk/api/2.0/compliance/projects" -H "accept: application/json"
# Get projects
$action = 'compliance/projects'
$restUri = ('https://{root}/api/2.0/{action}/').replace('{root}',$root).Replace('{action}',$action)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$1 = $response | ConvertFrom-Json
$1.list

#curl -X GET "https://netdesigndemo.risma.dk/api/2.0/compliance/projects/1/questionnaire" -H "accept: application/json"
# Get questionnaires
$action = 'compliance/projects/1'
$action2 = 'questionnaire'
$restUri = ('https://{root}/api/2.0/{action}/{action2}').replace('{root}',$root).Replace('{action}',$action).Replace('{action2}',$action2)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$1 = $response | ConvertFrom-Json
$1.list | Format-Table

#curl -X GET "https://netdesigndemo.risma.dk/api/2.0/projects/{projectId}/questionnaire/72" -H "accept: application/json"
# Get project questionnaire details
$action = 'projects/1'
$action2 = 'questionnaire/113'
$restUri = ('https://{root}/api/2.0/{action}/{action2}').replace('{root}',$root).Replace('{action}',$action).Replace('{action2}',$action2)
$method = 'GET'
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$1 = $response | ConvertFrom-Json
$1.list | Format-Table

#https://netdesigndemo.risma.dk/api/2.0/compliance/informationAssets/processors/4/questionanswers/9320
# Answer question
$action = 'compliance/informationAssets/processors/4'
$action2 = 'questionanswers/9320'
$restUri = ('https://{root}/api/2.0/{action}/{action2}').replace('{root}',$root).Replace('{action}',$action).Replace('{action2}',$action2)
$method = 'PATCH'
$body = @'
{"answers_options":{"22175": "Ja"}
}
'@
$response = Invoke-WebRequest -Uri $restUri -Method $method -Body $body -ContentType "application/json" -WebSession $session
$response | Select-Object StatusCode,StatusDescription