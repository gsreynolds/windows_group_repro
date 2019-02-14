#
# Cookbook:: windows_group_repro
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user 'TestUser' do
  password 'password1234567890!%'
  action :create
end

group 'Administrators' do
  members [
    'TestUser'
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
