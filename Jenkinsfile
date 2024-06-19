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
                // No equivalent chmod needed on Windows
                echo 'This is a Windows environment, no chmod needed'
            }
        }
        stage('Relative path') {
            steps {
                script {
                    try {
                        bat "powershell -Command \"./scripts/fibonacci.ps1 ${params.NUMBER}\""
                    } catch (Exception e) {
                        error "Error executing the script with relative path: ${e.message}"
                    }
                }
            }
        }
        stage('Full path') {
            steps {
                script {
                    try {
                        bat "powershell -Command \"${env.WORKSPACE}/scripts/fibonacci.ps1 ${params.NUMBER}\""
                    } catch (Exception e) {
                        error "Error executing the script with full path: ${e.message}"
                    }
                }
            }
        }
        stage('Change directory') {
            steps {
                script {
                    dir("${env.WORKSPACE}/scripts") {
                        try {
                            bat "powershell -Command \"./fibonacci.ps1 ${params.NUMBER}\""
                        } catch (Exception e) {
                            error "Error executing the script in changed directory: ${e.message}"
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            echo "This step will run after all other steps have finished. It will always run, even if the build status is not SUCCESS."
        }
        failure {
            echo "The build has failed."
        }
        success {
            echo "The build was successful."
        }
    }
}
