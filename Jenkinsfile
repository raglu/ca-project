node {
	stage('Preparation') {        
		checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
		doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
		pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
		repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'raglu', 
		url: 'git@github.com:raglu/ca-project.git']]])   
	}
	stage('Build'){
		sh 'docker build -t raglu16/codechan .'
	}
	stage('Result'){
		sh 'docker run -i raglu16/codechan tests.py'
	}
	stage('Publish'){
		pretestedIntegrationPublisher()
	}
	stage('Archive'){
		archiveArtifacts 'run.py'
	}
	stage('Push image'){
		sh 'docker push raglu16/codechan:latest' 	
	}
}
node{
	stage('newstage'){
		echo 'this is a stage on a new node'
	}
}