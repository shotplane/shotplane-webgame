#   _____  _    _ _   _ 
#  |  __ \| |  | | \ | |
#  | |__) | |  | |  \| |
#  |  _  /| |  | | . ` |
#  | | \ \| |__| | |\  |
#  |_|  \_\\____/|_| \_|
#   
FROM nginx:alpine AS RUNNER 

WORKDIR /etc/nginx/conf.d
COPY nginx.conf default.conf

WORKDIR /webgl
COPY webgl/ .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
