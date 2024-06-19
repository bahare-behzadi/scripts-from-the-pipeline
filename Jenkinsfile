pipeline {
    agent any
    parameters {
        choice(name: 'NUMBER', choices: [10,20,30,40,50,60,70,80,90], description: 'Select the value for F(n) for the Fibonacci sequence.')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '10', numToKeepStr: '10'))
        timeout(time: 12, unit: 'HOURS')
        timestamps()
    }
    triggers {
        cron('@midnight')
    }
    stages {
        stage('Make executable') {
            steps {
                bat 'echo "This is a Windows environment, no chmod needed"'
            }
        }
        stage('Relative path') {
            steps {
                bat 'powershell -Command "./scripts/fibonacci.ps1 ${env.NUMBER}"'
            }
        }
        stage('Full path') {
            steps {
                bat "powershell -Command \"${env.WORKSPACE}/scripts/fibonacci.ps1 ${env.NUMBER}\""
            }
        }
        stage('Change directory') {
            steps {
                dir("${env.WORKSPACE}/scripts") {
                    bat 'powershell -Command "./fibonacci.ps1 ${env.NUMBER}"'
                }
            }
        }
    }
}
