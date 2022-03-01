
docker_build('hands-on-krakend', '.',
  only=['./krakend.json', "./example-plugin/", "./proxy-plugin/", "./router-plugin/"])

k8s_yaml(['k8s-krakend.yaml'])
k8s_resource(workload='krakend', port_forwards=[
    port_forward(18080, 8080, 'Weather API', '/weather')])
k8s_resource(workload='krakend', port_forwards=[
    port_forward(18090, 8090, 'Stats', '/__stats')])