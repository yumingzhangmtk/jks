def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, cloud: 'kubernetes', containers: [
	containerTemplate(name: 'jnlp', image: 'ninech/jnlp-slave-with-docker', args: '${computer.jnlpmac} ${computer.name}')
	],
	volumes: [
	hostPathVolume(hostPath: '/var/run/docker.sock', mountPath: '/var/run/docker.sock')
	]
) {
    node(label) {
    	checkout scm

    	env.DOCKER_API_VERSION="1.23"
    	sh "git rev-parse --short HEAD > commit-id"
    	tag = readFile('commit-id').replace("\n", "").replace("\r", "")
    	appName = "my_mtk"
    	registryHost = "172.27.16.100:5000/"
    	imageName = "${registryHost}${appName}:${tag}"
    	env.BUILDIMG=imageName

    	stage "Build"
        	sh "docker build -t ${imageName} ."

    	stage "Unit test"
        	sh "echo unit test"

    	stage "Push"
        	sh "docker push ${imageName}"

    	stage "Deploy"
        	sh "sed 's#172.27.16.100:5000/my_mtk:20180718v3#'$BUILDIMG'#' my_mtk.yaml > my_mtk.tmp.yaml"
        	sh "kubectl apply -f my_mtk.tmp.yaml"
        	sh "kubectl rollout status deployment.apps/my-nginx-nodeport"
    }
}
