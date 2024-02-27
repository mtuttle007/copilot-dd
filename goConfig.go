package main

import (
    "context"
    "fmt"
    metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
    "k8s.io/client-go/kubernetes"
    "k8s.io/client-go/tools/clientcmd"
    "k8s.io/apimachinery/pkg/types"
    "k8s.io/apimachinery/pkg/util/json"
)

func main() {
    kubeconfig := "/path/to/your/kubeconfig/file"
    config, err := clientcmd.BuildConfigFromFlags("", kubeconfig)
    if err != nil {
        panic(err.Error())
    }

    clientset, err := kubernetes.NewForConfig(config)
    if err != nil {
        panic(err.Error())
    }

    deploymentName := "myapp-deployment"
    namespace := "default"
    replicas := int32(5)

    scale := &metav1.PartialObjectMetadata{
        ObjectMeta: metav1.ObjectMeta{
            Name:      deploymentName,
            Namespace: namespace,
        },
    }
    scaleJSON := []byte(fmt.Sprintf(`{"spec":{"replicas":%d}}`, replicas))

    _, err = clientset.AppsV1().Deployments(namespace).Patch(context.TODO(), deploymentName, types.StrategicMergePatchType, scaleJSON, metav1.PatchOptions{})
    if err != nil {
        panic(err.Error())
    }

    fmt.Printf("Scaled deployment %s to %d replicas\n", deploymentName, replicas)
}