# Gradle build with sonarqube
Run Gradle build with sonarqube to generate report and use the same for Quality Gate Check with sonarqube.

# Pre-Requisites
You need to install Github Apps for Sonarqube in your Organization level to allow Sonarqube access in the repository to scan and provide the report.
You can refer the below link to create your Github App for Sonarqube:- 

[How To Create Github App](https://docs.github.com/en/enterprise-server@3.1/developers/apps/building-github-apps/creating-a-github-app).

[How To Install Github App](https://docs.github.com/en/enterprise-server@3.1/developers/apps/managing-github-apps/installing-github-apps).

# Usage
```yaml
on: push
name: Gradle build with sonarqube
jobs:
  gradle-build:
    name: gradle build with sonarqube
    runs-on: ubuntu-latest
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2
      - name: Setup Gradle
        uses: gradle/gradle-build-action@v2
      - name: Sonarqube Scan with Gradle Build
        timeout-minutes: 5
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
        uses: trideepnag1911/gradle-build-with-sonarqube@v1.0
```
You need to setup secret for the variable SONAR_HOST_URL & SONAR_TOKEN preior to use this action.

# Usage with build_path parameter
```yaml
on: push
name: Gradle build with sonarqube
jobs:
  gradle-build:
    name: gradle build with sonarqube
    runs-on: ubuntu-latest
    steps:
      - name: Code Checkout
        uses: actions/checkout@v2
      - name: Setup Gradle
        uses: gradle/gradle-build-action@v2
      - name: Sonarqube Scan with Gradle Build
        timeout-minutes: 5
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
        uses: trideepnag1911/gradle-build-with-sonarqube@v1.0
        with:
          build_path: /src
```
