pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '10')) // Retain history on the last 10 builds
    ansiColor('xterm') // Enable colors in terminal
    timestamps() // Append timestamps to each line
    timeout(time: 20, unit: 'MINUTES') // Set a timeout on the total execution time of the job
  }
}
  stages {  // Define the individual processes, or stages, of your CI pipeline
    stage('Checkout') { // Checkout (git clone ...) the projects repository
      steps {
        checkout scm
      }
    }
    stage('Setup') { // Install any dependencies you need to perform testing
      steps {
        script {
          sh """
          python -m pip install --upgrade pip
          pip install flake8 pytest
          """
        }
      }
    }
    stage('Linting') { // Run pylint against your code
      steps {
        script {
          sh """
          flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
          flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
          """
        }
      }
    }
    stage('Unit Testing') { // Perform unit testing
      steps {
        script {
          sh """
          python3 -m pytest
          """
        }
      }
    }
  }