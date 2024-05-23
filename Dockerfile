#   _____  _    _ _   _ 
#  |  __ \| |  | | \ | |
#  | |__) | |  | |  \| |
#  |  _  /| |  | | . ` |
#  | | \ \| |__| | |\  |
#  |_|  \_\\____/|_| \_|
#   
FROM nginx:alpine AS RUNNER 

COPY nginx.conf     /etc/nginx/nginx.conf

RUN mkdir -p        /usr/share/nginx/html
COPY index.html     /usr/share/nginx/html/index.html
COPY Build          /usr/share/nginx/html/Build
COPY TemplateData   /usr/share/nginx/html/TemplateData
COPY .vs            /usr/share/nginx/html/.vs

# RUN gunzip /usr/share/nginx/html/Build/catpln.data.gz
# RUN gunzip /usr/share/nginx/html/Build/catpln.framework.js.gz
# RUN gunzip /usr/share/nginx/html/Build/catpln.wasm.gz


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
