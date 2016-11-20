remote_file '/home/ec2-user/' do
  source 'https://s3-us-west-2.amazonaws.com/nustorage/nubootstrap.yml.gz'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0644'
  action :create
end

execute 'unzip_yml' do
  command 'gunzip nubootstrap.yml.gz'
  owner 'ec2-user'
  group 'ec2-user'
  cwd '/home/ec2-user/'
  action :run
end

execute 'docker_compose_up' do
  command 'docker-compose -f nubootstrap.yml up -d --force-recreate'
  cwd '/home/ec2-user/'
  action :run
end
