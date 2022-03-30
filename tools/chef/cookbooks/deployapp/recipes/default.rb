#
# Cookbook:: deployapp
# Recipe:: default
#
# Copyright:: 2022, Dries De Houwer, All Rights Reserved.
execute "update" do
    command "apt-get update -y"
end

package 'git' do
    action :install 
end

execute "clone" do
    command "git clone https://access-token:glpat-CzRR-GWhMuzydztPPV47@gitlab.com/kdg-ti/the-lab/teams/goeie-vraag/dotnetapp.git"
end 

package 'docker.io' do
    action :install 
end

execute "clone" do
    command "cd dotnetapp && docker build . -t dotnetapp"
end 

execute "clone" do
    command "docker run -d -p 5000:5000 -e ASPNETCORE_ENVIRONMENT=\"Development\" dotnetapp"
end 