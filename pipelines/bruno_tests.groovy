
timeout(120) {
   node("ansible") {
     currentBuild.description = "Running bruno-tests on Jenkins"

     try {
         stage("Checkout") {
             checkout scm  //стягиваем проект
         }
         stage("Build Docker image") {
             docker.withRegistry("http://localhost:5005") { //в Registry, который прилагается к дженкинсу
                 docker.build("bruno_tests:1.1").push() //собираем докер-образ и пушим его в Registry для дальнейшего запуска
             }
         }
     }  finally {
         cleanWs(deleteDirs: true)
     }

     dir("bruno") {
         try {
             stage("Checkout") {
                 checkout scm  //стягиваем проект
             }
             stage("Running bruno-tests") {
                 sh "pwd"
                 sh "ls -la"
                 ansiblePlaybook playbook: "playbook.yml" //плейбука, которая запускает тесты
             }
             
         } finally {
             deleteDir()
         }
     }
   }
}
