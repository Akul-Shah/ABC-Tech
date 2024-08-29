pipeline {
    agent any
    stages 
    {
        stage ('Code Checkout') 
        {
            steps
            {
                git branch: 'main', poll: false, url: 'https://github.com/Akul-Shah/ABC-Tech.git'
            }
        }
        stage ('Compile') 
        {
            steps
            {
                sh 'mvn compile'
            }
        }
        stage ('Unit Test') 
        {
            steps
            {
                sh 'mvn test'
            }
        }
        stage ('Build') 
        {
            steps
            {
                sh 'mvn package'
            }
        }
        stage ('Docker Image') 
        {
            steps
            {
                sh 'cp /var/lib/jenkins/workspace/$JOB_NAME/target/ABCtechnologies-1.0.war abc-tech.war'
                sh 'docker build -t akulshah/abc-tech:$BUILD_NUMBER .'
            }
        }
        stage ('Docker Push')
        {
            steps
            {
            withDockerRegistry(credentialsId: 'Dockerhub', url:"") 
            {
            sh 'docker push akulshah/abc-tech:$BUILD_NUMBER'
            } 
            }
        }
        stage ('Docker Deploy')
        {
            steps
            { 
             sh 'docker run -itd -p 6000:8080 akulshah/abc-tech:$BUILD_NUMBER'   
            }
        }
        stage ('K8s Deploy')
        {
            steps
            { 
             sh 'kubectl create -f abc-deployment.yml'
             sh 'kubectl create -f service.yaml'
            }
        }
    }
}
