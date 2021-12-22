FROM maven:3-jdk-8-alpine

WORKDIR /dostavimvse

COPY . .

RUN mvn install -Dstart-class=Main
RUN java  -jar target/dostavimvse-0.0.1-SNAPSHOT.jar

RUN mvn clean install -Dstart-class=ru.fivt.dostavimvse.DostavimvseApplication
RUN cp target/dostavimvse-0.0.1-SNAPSHOT.jar DostavimvseApplication.jar

ENTRYPOINT java -jar DostavimvseApplication.jar
