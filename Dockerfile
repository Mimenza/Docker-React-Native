# Usa una imagen base de Node.js con Ubuntu
FROM node:18-buster

# Instalar dependencias del sistema necesarias para React Native
RUN apt-get update && apt-get install -y \
  openjdk-11-jdk \
  python3 \
  python3-pip \
  libncurses5 \
  libstdc++6 \
  lib32z1 \
  lib32ncurses6 \
  lib32stdc++6 \
  lib32z1-dev \
  xz-utils \
  && apt-get clean

# Instalar Android SDK
RUN mkdir -p /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Instalar dependencias de React Native
RUN npm install -g react-native-cli

# Establecer el directorio de trabajo
WORKDIR /app

# Volúmenes persistentes para tu proyecto React Native
VOLUME ["/app"]

# Exponer el puerto que usará tu aplicación React (por defecto es 3000)
EXPOSE 3000

# Comando por defecto (puedes cambiarlo según lo necesites)
CMD ["bash"]