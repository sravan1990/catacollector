pipeline {
    agent any

    stages {
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

node {
    def remote = [:]
    remote.name = "Sellers Consult"
    remote.host = "192.168.1.92"
    remote.allowAnyHosts = true
    remote.user = 'pramod'
    remote.password = 'pramod'

    //node {
    //    withCredentials([usernamePassword(credentialsId: 'sshUserAcct', passwordVariable: 'password', usernameVariable: 'userName')]) {
    //        remote.user = 'pramod'
    //        remote.password = 'pramod'

            stage("SSH Steps Rocks!") {
                steps{
                    echo 'SSH Step. Reached here.'
                }
            }
                //writeFile file: 'test.sh', text: 'ls'
                //sshCommand remote: remote, command: 'for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done'
                //sshScript remote: remote, script: 'test.sh'
                //sshPut remote: remote, from: 'test.sh', into: '.'
                //sshGet remote: remote, from: 'test.sh', into: 'test_new.sh', override: true
                //sshRemove remote: remote, path: 'test.sh'
}
