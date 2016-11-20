package 'docker' do
  action :install
end

remote_file '/usr/local/bin/docker-compose' do
  source 'https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

group 'docker' do
  members 'ec2-user'
  action :create
  append true
end

service 'docker' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
