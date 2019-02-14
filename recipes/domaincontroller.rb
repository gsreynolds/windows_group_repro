#
# Cookbook:: windows_group_repro
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user 'TestUser' do
  password 'password1234567890!%'
  action :create
end

windows_ad_user "Joe Smith" do
  action :create
  domain_name "contoso.com"
  ou "users"
  options ({ "samid" => "JSmith",
         "upn" => "JSmith@contoso.com",
         "fn" => "Joe",
         "ln" => "Smith",
         "display" => "Smith, Joe",
         "disabled" => "no",
         "pwd" => "Passw0rd"
       })
end

group 'Administrators' do
  members [
    'contoso\\JSmith',
    'contoso\\TestUser'
  ]
  append true
  action :modify
end

# group 'FakeGroup' do
#   members [
#     'TestUser',
#   ]
#   append true
#   action :modify
# end
