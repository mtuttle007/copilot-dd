from kubernetes import client, config

def scale_deployment(name, namespace, replicas):
    config.load_kube_config()

    with client.ApiClient() as api_client:
        v1 = client.AppsV1Api(api_client)
        body = {
            "spec": {
                "replicas": replicas
            }
        }
        v1.patch_namespaced_deployment_scale(name, namespace, body)

scale_deployment('myapp-deployment', 'default', 5)