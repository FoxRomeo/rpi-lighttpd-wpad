pipeline {
        agent {
                label 'arm32v6 && Docker'
        }
        triggers {
                cron('H H(2-7) * * 2')
        }
        options {
                skipStagesAfterUnstable()
                disableResume()
                timestamps()
        }
        environment {
                REGISTRY = "intrepidde"
                EMAIL_TO = 'olli.jenkins.prometheus@intrepid.de'
                NAME = "rpi-lighttpd-wpad"
                SECONDARYREGISTRY = "nexus.intrepid.local:4000"
                SECONDARYNAME = "${NAME}"
                COMMANDSHELL = "/bin/bash"
                TARGETRUNVERSION = "./run_version.sh"
        }
        stages {
                stage('Build') {
			environment {
			    ACTION = "build"
			}
                        steps {
                                sh './action.sh'
                        }
                }
                stage('Push') {
			environment {
			    ACTION = "push"
			}
                        steps {
                                sh './action.sh'
                        }
                }
        }
        post {
                always {
                        cleanWs()
                }
                success {
                        echo 'BUILD OK'
                }
                failure {
                        emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}',
                        to: EMAIL_TO,
                        subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
                }
                unstable {
                        emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}',
                        to: EMAIL_TO,
                        subject: 'Unstable build in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
                }
                changed {
                        emailext body: 'Check console output at $BUILD_URL to view the results.',
                        to: EMAIL_TO,
                        subject: 'Jenkins build is back to normal: $PROJECT_NAME - #$BUILD_NUMBER'
                }
        }
}