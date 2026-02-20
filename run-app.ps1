$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-21.0.1.12-hotspot"
$env:PATH = "$env:JAVA_HOME\bin;" + $env:PATH
Set-Location "c:\Users\Alejandro\Desktop\App-SpringBoot"
.\mvnw spring-boot:run
