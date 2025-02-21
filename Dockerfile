# 打包后端镜像 先用maven打jar包

# 基础镜像
FROM openjdk:17-jdk-alpine
LABEL authors="MessInWind"

# 设定时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 拷贝jar包
COPY target/example-*.jar /app.jar

# 入口
ENTRYPOINT ["java", "-jar", "/app.jar"]