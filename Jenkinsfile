pipeline {
    agent any

    stages {
        stage('SSH'){
            steps{
                echo 'connecting to server'
            def remote = [:]
            remote.name = 'test'
            remote.host = '192.168.1.92'
            remote.user = 'pramod'
            remote.password = 'pramod'
            remote.allowAnyHosts = true
            }
        }
        stage('Remote SSH') {
            writeFile file: 'abc.sh', text: 'ls -lrt'
            sshScript remote: remote, script: "abc.sh"
        }
        stage('Code Checkout') {
            steps {
                echo 'Checkingout code..'
            }
        }
        stage('Build') {
            steps {
                echo 'building..'
            }
        }
        stage('Execute script') {
            steps {
                echo 'Executing shell scripts....'
            }
        }
    }
}
