FROM public.ecr.aws/nginx/nginx-unprivileged:1.25-alpine

ARG UID=101

# Set Tokyo Timezone
USER root
RUN apk add -U tzdata
ENV TZ=Asia/Tokyo
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

USER $UID
COPY ./docker/ecs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/ecs/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

COPY ./public /var/www/public

# RUN nginx -T
