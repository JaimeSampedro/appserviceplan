
appserviceplanFilePath= attribute('appserviceplanFilePath')

describe file(appserviceplanFilePath) do
  its('content') { should match "ProvisioningState                       : Succeded"}
end

describe file(appserviceplanFilePath) do
  its('content') { should match "Status                   : Ready"}
end
