pipeline{
    agent any

    environment{
        DOCKER_IMAGE = 'apimonedas'
        CONTAINER_NAME = 'dockerapimonedas'
        DOCKER_NETWORK = 'dockerdbmonedas_red'
        DOCKER_BUILD_DIR = 'presentacion'
        HOST_PORT = '8081'
        CONTAINER_PORT = '8082'
    }

    stages{
        stage('Complicacion Maven'){
            steps{
                bat 'mvn clean package -Dskiptests'
            }
        }
        stage('Creación de la imagen'){
            steps{
                dir("${DOCKER_BUILD_DIR}"){
                    bat "docker build . -t ${DOCKER_IMAGE}"
                }
            }
        }
        stage('Desplegar contenedor'){
            steps{
                dir("${DOCKER_BUILD_DIR}"){
                    bat "docker run --name ${CONTAINER_NAME}  --network ${DOCKER_NETWORK} -p  ${HOST_PORT}:${CONTAINER_PORT} -d ${DOCKER_IMAGE}"
                }
            }
        }

    }
}