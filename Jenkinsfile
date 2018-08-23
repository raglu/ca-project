node {
	stage('Preparation') {        
		checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
		doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
		pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
		repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'raglu', 
		url: 'git@github.com:raglu/ca-project.git']]])   
	}
	stage('Build'){
		sh 'docker build -t codechan .'
	}
	stage('Result'){
		sh 'docker run -i codechan tests.py'
	}
	stage('Publish'){
		pretestedIntegrationPublisher()
	}
	stage('Archive'){
		archiveArtifacts 'run.py'
	}
	stage('Push image'){
		when {
			branch 'master'
		}
		steps {
			withDockerRegistry([ credentialsId: "", url: "" ]) {
			sh 'docker push codechan'
			}
		}
	}
}