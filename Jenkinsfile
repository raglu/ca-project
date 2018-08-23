node {
    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository

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
   
}