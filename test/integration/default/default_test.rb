# # encoding: utf-8

# Inspec test for recipe windows_group_repro::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# https://stackoverflow.com/questions/48592120/how-do-i-find-out-from-powershell-if-i-am-on-a-server-or-workstation
describe powershell('(Get-CimInstance -ClassName Win32_OperatingSystem).ProductType') do
  its('strip') { should eq '3' } # Server
end

describe command('net localgroup Administrators') do
  its('stdout') { should_not match /JSmith/ }
  its('stdout') { should match /TestUser/ }
end

# PowerShell 5+
# describe powershell('Get-LocalGroupMember -Group "Administrators"') do
#   its('stdout') { should match /TestUser/ }
# end

# PowerShell 4
describe powershell('Get-WmiObject Win32_GroupUser | Where GroupComponent –like \'*"Administrators"\'') do
  its('stdout') { should_not match /JSmith/ } 
  its('stdout') { should match /TestUser/ }
end
