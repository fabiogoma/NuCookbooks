require 'json'

props_file = File.read('/tmp/schedule.json')
json_props = JSON.parse(props_file)

template '/home/ec2-user/nudummy.yml' do
  source 'nudummy.yml.erb'
  mode '0644'
  owner 'ec2-user'
  group 'ec2-user'
  variables({
              IMAGE: json_props['job']['image'],
              TZ: json_props['job']['variables']['TZ'],
              AWS_ACCESS_NAME: json_props['job']['variables']['AWS_ACCESS_NAME'],
              AWS_ACCESS_KEY: json_props['job']['variables']['AWS_ACCESS_KEY'],
              AWS_SECRET_KEY: json_props['job']['variables']['AWS_SECRET_KEY'],
              SQS_LAUNCH_URL: json_props['job']['variables']['SQS_LAUNCH_URL'],
              SQS_UPDATE_URL: json_props['job']['variables']['SQS_UPDATE_URL'],
              SQS_DESTROY_URL: json_props['job']['variables']['SQS_DESTROY_URL'],
              AWS_SECURITY_GROUP: json_props['job']['variables']['AWS_SECURITY_GROUP'],
              AWS_SPOT_PRICE: json_props['job']['variables']['AWS_SPOT_PRICE'],
              REGION: json_props['job']['variables']['REGION']
            })
end

execute 'docker_compose_up' do
  command 'docker-compose -f nudummy.yml up -d --force-recreate'
  cwd '/home/ec2-user/'
  action :run
end
