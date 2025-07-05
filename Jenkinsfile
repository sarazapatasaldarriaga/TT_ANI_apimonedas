pipeline{
    agent any

    environment{
        DOCKER_IMAGE = 'apimonedas'
        CONTAINER_NAME = 'dockerapimonedas'
        DOCKER_NETWORK = 'dockerdbmonedas_red'
        DOCKER_BUILD_DIR = 'presentacion'
        HOST_PORT = '9080'
        CONTAINER_PORT = '8080'
    }

    stages{
        /*stage('Complicacion Maven'){
            steps{
                bat 'mvn clean package -Dskiptests'
            }
        }*/
        stage('Creación de la imagen'){
            steps{
               // dir("${DOCKER_BUILD_DIR}"){
                    bat "docker build . -t ${DOCKER_IMAGE}"
               // }
            }
        }

        stage('Limpiar contenedor existente'){
            steps{
                script{
                   /* catchError(buildResult: 'SUCCESS', stageResult:'UNSTABLE'){
                        bat """
                        docker container inspect ${CONTAINER_NAME} >nul 2>&1 && (
                        docker contaienr stop ${CONTAINER_NAME}
                        docker container rm ${CONTAINER_NAME}
                        ) || echo "No existe el contenedor '${CONTAINER_NAME}'."
                    */
                    bat """
                    docker ps -a -q -f "name=dockerapimonedas" > tmp.txt
                    for /f %%i in (tmp.txt) do docker rm -f %%i
                    del tmp.txt
                    """
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